#include <Arduino.h>
#include <Adafruit_BNO08x.h>
#include <cmath>

#include "file_operations.h"





/***************************************************************************
 rocket altitude instrumentation

 Use: stores altitude and accelerometer data to an SD card during a rocket flight

 Equipment:
 - Adafruit RP2040 Adalogger
 - BMP280 pressure, temperature, humidity breakout board
 - BNO085 IMU breakout board
 - Li-ion battery
 - QWIIC cables

 author: Lt Col Jordan Firth, USSF
 jordan.firth@afacademy.af.edu
 2024-12

 inputs: sensor data

 outputs: accelerations and altitudes written to `flight_.csv` on SD card
  - data is stored in a new CSV file on each reboot
    -- will store up to 52 data files
    -- flightA.csv, flight B.csv, ..., flightZ.csv, flighta.csv, ... flightz.csv
    -- will not store any more data if 'flightz.csv' exists

 assumptions and limitations:
 - atmospheric pressure & temp won't change significantly during flight
 - actual recorded altitude will be wrong because pressure won't be updated

 coupling
 - adafruit BNO08x library
 - adafruit BMP280 library
 - adafruit neopixel library
 - library "SdFat - Adafruit Fork" by Bill Greiman
 - RP2040 board definition file from EarlePhilhower
    - must configure additional board manager URL:
    https://github.com/earlephilhower/arduino-pico/releases/download/global/package_rp2040_index.json

 ***************************************************************************/

#include <Wire.h>
// in C++ '#' indicates a preprocessor instruction--code to tell the compile how to operate
// '#include' means that you are going to use functions from that file/library
// '<Wire.h>' is Arduino's I2C communication protocol
// the QWIIC cables you used for sensors are a standardized connection for I2C communication

// ordinarily you would need to include these files too, but
// arduino IDE automatically includes all *.ino files in the program directory
//
// #include "setup_functions.ino"
// #include "errors.ino"

// SD card setup ////////
#include <SPI.h>
#include "SdFat.h"
#define SD_CS_PIN 23

SdSpiConfig config(SD_CS_PIN, DEDICATED_SPI, SD_SCK_MHZ(16), &SPI1);
// end SD card setup ////////

// LED/neopixel setup
#define neopixel_pin 17   // on rp2040 adalogger the neopixel LED is pin 17
#define neopixel_count 1  // there is one neopixel LED
#include <Adafruit_NeoPixel.h>
Adafruit_NeoPixel strip(neopixel_count, neopixel_pin);

#include "main.h"

TelemetryLogger logger;

// BMP280/BME280 PT (press, temp) sensor variable declaration ////////
#include <Adafruit_Sensor.h>
#include <Adafruit_BMP280.h>
#include <Adafruit_BME280.h>
#define SEALEVELPRESSURE_HPA (1013.25)  // 1013.25 hPa is standard sea level pressure
// end BMP280/BME280 PT  ////////

// BNO085 IMU variable declaration ////////
#include <Adafruit_BNO08x.h>
Adafruit_BNO08x bno08x(-1);
sh2_SensorValue_t sensorValue;
// end BNO085 IMU setup ////////

// setup altitude/accel variables ////////
#include <iostream>
#include <vector>
float altitudes = 0.0;  // holds a moving sum of altitudes
float altitude;         // avg altitude in last cycle
float max_altitude = 0.0; // holds max reported altitude

std::vector<float> accels = {0, 0, 0};  // holds moving sums of 3 accels
float accel_x, accel_y, accel_z ;       // 3 acceleration variables
std::vector<float> gyros = {0, 0, 0};  // holds moving sums of 3 accels
float gyro_x, gyro_y, gyro_z ;       // 3 acceleration variables
std::vector<float> mags = {0, 0, 0};  // holds moving sums of 3 accels
float mag_x, mag_y, mag_z ;       // 3 acceleration variables

float sensor_reads = 0.0f;              // num sensor reads in last cycle
float accel_reads = 0.0f;
float gyro_reads = 0.0f;
float alt_reads = 0.0f;

// end setup altitude/accel variables ////////

// declare flight phases ////////
enum FLIGHT_PHASES{ // define valid flight phase names
  ON_PAD = 0,
  THRUST = 1,
  COAST = 2,
  UNDER_PARACHUTE = 3,
  COMPLETE = 4,
};
FLIGHT_PHASES flight_phase = ON_PAD;  // variable flight_phase can hold one of the 5 valid phases
                                      // the variable will be a number, but can code with the word
// end declare flight phases ////////

void setup() {
  Serial.begin(9600); // open a serial port with speed of 9600 baud
  delay(2500);        // wait 2500 ms (helpful to ensure data gets displayed on serial port)

  Wire.setClock(1000000); // Uncomment for Fast Mode: 400 kHz
  Wire.begin();

  //neopixel setup
  strip.begin();
  strip.show(); // initialize all pixels to OFF

  // sensor initialization functions defined in main.h
  initialize_barometer();
  initialize_bno08x();


  while (!sd.begin(config)) {
    Serial.println("initialization failed! Retrying...");
    error_initializing_SD(); // defined in errors.ino
  }
  Serial.println("successful SD initialization");

  
  create_and_open_file(&myFile, "launch");
  Serial.println("launch file created");
  myFile.close();

}  // end of setup()

// define some timing and writing variables ////////

int timestamp;      // timestamp at start of current loop() execution
int SD_write_due = millis();  // millis() is current time, first write ASAP; if past SD_write_due, write data to SD
int SD_sample_interval = 25;              // ms, time between SD writes

int serial_write_due = SD_write_due;  // if past, write data to serial port
int serial_sample_interval = 250;         // ms, time between serial writes
// end timing and writing variables ////////

bool CSV_header_complete = false;

void loop() {
  timestamp = millis(); //

  if (altimeter_is_bme) {
    altitudes += bme.readAltitude(SEALEVELPRESSURE_HPA);
  } else {
    altitudes += bmp.readAltitude(SEALEVELPRESSURE_HPA);
  }
  alt_reads++;

  if (bno08x.wasReset()) {
    Serial.print("sensor was reset ");
    setReports();
  }

  while (bno08x.getSensorEvent(&sensorValue)) {
    // new data availale
    switch (sensorValue.sensorId) {

    case SH2_ACCELEROMETER:
      // accumulate acceleration values between data file writes
      accels.at(0) += sensorValue.un.linearAcceleration.x;
      accels.at(1) += sensorValue.un.linearAcceleration.y;
      accels.at(2) += sensorValue.un.linearAcceleration.z;
      accel_reads++;
      break;

    case SH2_GYROSCOPE_CALIBRATED:
      gyros.at(0) += sensorValue.un.gyroscope.x;
      gyros.at(1) += sensorValue.un.gyroscope.y;
      gyros.at(2) += sensorValue.un.gyroscope.z;
      gyro_reads++;
      break;

    case SH2_MAGNETIC_FIELD_CALIBRATED:
      mags.at(0) = sensorValue.un.magneticField.x;
      mags.at(1) = sensorValue.un.magneticField.y;
      mags.at(2) = sensorValue.un.magneticField.z;
      break;
    default: ;
    }
  }

  if (timestamp >= SD_write_due) {
    // if it's time for the next write...
    SD_write_due += SD_sample_interval; // update time of next write

    switch (flight_phase)
    {
    case ON_PAD:
      if (accel_y > 20.0){
        flight_phase = THRUST;
      }
      break;

    case THRUST:
      // add phase transition logic here

      break;

    case COAST:
      // add phase transition logic here asdfasdfawef ewaw efawe fae

      break;

    case UNDER_PARACHUTE:
      // add phase transition logic here

      break;

    case COMPLETE:
      // asdf
      break;

    default:
      // asdf
      break;
      //
    };

    // calculate data from accumulated values
    if (alt_reads == 0) {
      altitude = NAN;
    }
    else{
      altitude = altitudes/alt_reads;
      if (altitude > max_altitude) {max_altitude = altitude;}
    }

    if (accel_reads == 0) {
      accel_x = NAN; accel_y = NAN; accel_z = NAN;
    }
    else{
        accel_x = accels.at(0)/accel_reads;
        accel_y = accels.at(1)/accel_reads;
        accel_z = accels.at(2)/accel_reads;
      }

      if (gyro_reads == 0) {
        gyro_x = NAN; gyro_y = NAN; gyro_z = NAN;
      }
      else{
        gyro_x =  gyros.at(0) /gyro_reads;
        gyro_y =  gyros.at(1) /gyro_reads;
        gyro_z =  gyros.at(2) /gyro_reads;
      }

        mag_x =  mags.at(0);
        mag_y =  mags.at(1);
        mag_z =  mags.at(2);

    logger.clear();
    logger.add("time","ms",millis());
    logger.add("altitude","m",altitude);
    // logger.add("ax","m/s^2", accel_x);
    logger.add("ay","m/s^2", accel_y);
    // logger.add("az","m/s^2", accel_z);
    logger.add("gy", "dps", gyro_y);
    logger.add("magx", "uT", mag_x);
    logger.add("magy", "uT", mag_y);
    // logger.add("magz","uT", mag_z);

    logger.add("phase","NA", flight_phase);

    if (!CSV_header_complete) {
      CSV_header_complete = true;
      logger.create_CSV_header(myFile);
    }

    // print/record data

    if (!CSV_header_complete) {
      CSV_header_complete = true;
      logger.create_CSV_header(myFile);
    }
    logger.logToCSV(myFile);
    // myFile.close();
    if (timestamp >= serial_write_due) {
      logger.logToSerial(Serial);
      serial_write_due += serial_sample_interval;
      myFile.flush();
    }

    // turn LED green to indicate good recording
      strip.setPixelColor(0, 0, 255, 0);
      strip.show();

    // end print/record data

    // reset data accumulators and counts to zero
    accel_reads = 0.0f;
    gyro_reads = 0.0f;
    alt_reads = 0.0f;

    altitudes = 0.0f;
    accels = {0.0, 0.0, 0.0};
    gyros = {0.0, 0.0, 0.0};
    mags = {0.0, 0.0, 0.0};
  }  // end if (timestamp > write_due)

}    // end loop()
