// neopixel_setup.h
//
// defines blinking commands if using an RP2040 adalogger with a neopixel on pin 17

#pragma once



    #ifdef PIN_NEOPIXEL

        #include <Adafruit_NeoPixel.h>
        
        Adafruit_NeoPixel strip(1, PIN_NEOPIXEL, NEO_GRB);
        const int ledBPin = PIN_NEOPIXEL;  // the number of the LED pin

        #define SETUP_LED_B     strip.begin(); \
                                strip.show(); // Initialize all pixels to 'off'
        
        #define UPDATE_LED_B    strip.setPixelColor(0, strip.Color(0, LedBState, 0)); \
                                strip.show(); // (note: 0, 1, 0 is green)

    #else
        #define UPDATE_LED_B digitalWrite(ledBPin, LedBState);

        #define SETUP_LED_B // nothing to do here
        
    #endif



// RP2040 Adalogger-specific code
