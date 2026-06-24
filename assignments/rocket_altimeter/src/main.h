#include <Adafruit_NeoPixel.h>
extern Adafruit_NeoPixel strip;

#include <Adafruit_BNO08x.h>
extern Adafruit_BNO08x bno08x;

#include <Adafruit_BMP280.h>
#include <Adafruit_BME280.h>
inline Adafruit_BMP280 bmp;                    // I2C
inline Adafruit_BME280 bme;                    // I2C
inline bool altimeter_is_bme;


#include <variant>
#include <vector>


void setReports();

// ****** define setup functions


// ******* error function definitions
inline void error_initializing_SD(void){
  // if no SD card, blink red 1 Hz
  strip.setPixelColor(0, 25, 0, 0);
  strip.show();
  delay(500);
  strip.setPixelColor(0, 0, 0, 0);
  strip.show();
  delay(500);
} // end error_initializing_SD()

inline void error_excess_files(void){
  // if out of files (>52 files), blink red 5 Hz
  while(1){
    strip.setPixelColor(0, 25, 0, 0);
    strip.show();
    delay(100);
    strip.setPixelColor(0, 0, 0, 0);
    strip.show();
    delay(100);
  } //end while
} // end error_excess_files()

inline void error_initializing_barometer(void){
  // if no barometer, turn red
  strip.setPixelColor(0, 25, 0, 0);
  strip.show();
}

// ******* end error function definitions


  // BMP280 PT sensor setup ///////
inline void initialize_barometer(void){
  if (bmp.begin()) {
    altimeter_is_bme = false;
    Serial.println(F("Found BMP280 sensor"));
  } else if (bme.begin()) {
    altimeter_is_bme = true;
    Serial.println(F("Found BME280 sensor"));
  } else {
    Serial.println(F("Could not find a valid BMP280 or BME280 sensor, check wiring!"));
    error_initializing_barometer();
    // In original code it was a while loop but let's keep it simple or follow original logic
    while (true) {
       delay(1000);
       if (bmp.begin()) { altimeter_is_bme = false;  Serial.println(F("Found BMP280 sensor")); break; }
       if (bme.begin()) { altimeter_is_bme = true;  Serial.println(F("Found BME280 sensor")); break; }
    }
  }
}

  // BNO085 setup ////////
  // Try to initialize!
inline void initialize_bno08x(void){
  if (!bno08x.begin_I2C()) {
    Serial.println("Failed to find BNO08x chip");
  } else {
    Serial.println("BNO08x Found!");
    setReports();
  }
  }   // end BNO085 IMU setup ////////


// setReports() ////////
// for the BNO085
// Here is where you define the sensor outputs you want to receive
inline void setReports(void) {
  Serial.println("Setting desired reports");
  // Set report rate to 20000us (20ms) which is 50Hz.
  // This ensures we get at least one update per 25ms logging interval.
  if (! bno08x.enableReport(SH2_ACCELEROMETER, 20000) ) {
    Serial.println("Could not enable acceleration vector");
  }
  if (! bno08x.enableReport(SH2_GYROSCOPE_CALIBRATED, 20000) ) {
    Serial.println("Could not enable rotation vector");
  }
  if (! bno08x.enableReport(SH2_MAGNETIC_FIELD_CALIBRATED, 20000) ) {
    Serial.println("Could not enable magnetic vector");
  }

}
// end function setReports() //////// 

// ******* end setup function definitions

/**
 * TelemetryLogger class
 * Handles mixed data types (int, float) for SD and Serial logging.
 */
class TelemetryLogger {
public:
  using TeleValue = std::variant<int, uint32_t, float>;

  struct Entry {
    const char* label;
    const char* unit;
    TeleValue value;
  };

  void add(const char* label, const char* unit, TeleValue value){
    entries.push_back({label, unit, value});
  }

  void clear() {
    entries.clear();
  }

  void logToSerial(Print& printer){
  for (const auto& e : entries) {
    printer.print(e.label);
    printer.print(":");
    std::visit([&printer](auto&& val) {
        printer.print(val);
        printer.print(", ");
    }, e.value);
  }
  printer.println();
  } // end logToSerial()

  void logToCSV(Print& printer){
    for (const auto& e : entries) {
      std::visit([&printer](auto&& val){
          printer.print(val);
          printer.print(", ");
      }, e.value);
    }
    printer.println();
  } // end logToCSV


  void create_CSV_header(Print& printer){
    for (const auto& e : entries) {
      printer.print(e.label);
      printer.print("_");
      printer.print(e.unit);
      printer.print(", ");
    }
    printer.println();
  } // end create_CSV_header()

private:
  std::vector<Entry> entries;
};


