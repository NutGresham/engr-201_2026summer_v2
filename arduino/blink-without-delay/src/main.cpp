/*
  Blink without Delay

  Turns on and off a light emitting diode (LED) connected to a digital pin,
  without using the delay() function. This means that other code can run at the
  same time without being interrupted by the LED code.

  The circuit:
  - Use the onboard LED.
  - Note: Most Arduinos have an on-board LED you can control. On the UNO, MEGA
    and ZERO it is attached to digital pin 13, on MKR1000 on pin 6. LED_BUILTIN
    is set to the correct LED pin independent of which board is used.

example modified from:  
  https://docs.arduino.cc/built-in-examples/digital/BlinkWithoutDelay/
*/

#include <Arduino.h>

// constants won't change. Used here to set a pin number:
const int ledAPin = LED_BUILTIN;  // the number of the LED pin
// if using another board (not RP2040 Adalogger), choose a 2nd pin to blink
// const int ledBPin = 5;  // the number of the LED pin

// ignore this (you can look at neopixel_setup.h if you want, but it's beyond the scope of this course)
  #include "neopixel_setup.h"

// Variables will change:
int LedAState = LOW;  // ledA used to set state of LED A
int LedBState = LOW;  // ledB used to set state of LED B

// Generally, you should use "unsigned long" for variables that hold time
// The value will quickly become too large for an int to store
unsigned long AUpdateDue = 0;  // will store next update time of LED A
unsigned long BUpdateDue = 0;  // will store next update time of LED B

unsigned long currentTime_ms; // will store the current time

// constants won't ever change (you can change them, but they won't change during execution)
constexpr long intervalA = 1000;  // interval at which to blink (milliseconds)
constexpr long intervalB = 450;   // interval at which to blink (milliseconds)

void setup() {
  // set the digital pin as output:
  pinMode(ledAPin, OUTPUT);
  pinMode(ledBPin, OUTPUT);

  // ignore this
  // SETUP_LED_B is defined in neopixel_setup.h and will either call 
  // strip.begin() or do nothing depending on whether the Adafruit_NeoPixel library is being used
  SETUP_LED_B
}

void loop() {
  // here is where you'd put code that needs to be running all the time.

  currentTime_ms = millis(); 


  // check to see if it's time to blink LedA
  if (currentTime_ms >= AUpdateDue) {
    // update the next due time to blink LedA
    AUpdateDue = currentTime_ms + intervalA;

    // if the LED is off turn it on and vice-versa:
    // compare this to the method used to toggle LedB below
    if (LedAState == LOW) {
      LedAState = HIGH;
    } // end
    else {
      LedAState = LOW;
    } // end else

    // set the LED with the ledState of the variable:
    digitalWrite(ledAPin, LedAState);
  } // end if (currentMillis >= AUpdateDue)


  // update the second LED with a different interval
if (currentTime_ms >= BUpdateDue) {
    // update the next due time to blink LedB
    BUpdateDue = currentTime_ms + intervalB;


    // compare this to the method used to toggle LedA above
    LedBState = !LedBState; // toggle the state of LedB

    // set the LED with the ledState of the variable:
    // UPDATE_LED_B is defined in neopixel_setup.h 
    // and will either call digitalWrite() or use the Adafruit_NeoPixel library to update the LED
    UPDATE_LED_B 


  } // end if (currentTime_ms >= BUpdateDue)

  
}
