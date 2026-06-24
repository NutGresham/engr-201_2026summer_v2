# project 05: rocket altimeter

You are developing a flight controller for small rockets. When complete, the controller should:
- record altitude data (during flight only)
- identify key flight events
- deploy a parachute at apogee

These development goals will not be completed during this course. You are responsible for developing the following incremental goals. 
- record altitude during a launch event (can include pre- and post-flight data)
- identify flight phases 
	- on pad
	- thrust
	- coast
	- under parachute
	- complete

If time permits, you should also work on the following stretch goals (bonus for this course). 
- record AGL altitude (above ground level)
- identify apogee

Hardware development nearly complete for this phase of the program. Software development is nearly complete. 

Read and understand provided code [05_rocket_altimeter.ino](./05_rocket_altimeter.ino). You do not need to read setup_functions.ino or errors.ino. 

See [project directions](#project%20directions) at the end of this file. 


# RA1 flight-like test
Modify code
Modify the provided arduino code to identify transitions between flight phases. The provided code identifies 5 distinct phases of flight. 

- on pad
- thrust
- coast
- under parachute
- complete

However, the logic to transition between flight phases is missing (on pad → thrust is provided for your reference). Use your knowledge of expected flight trajectory events to transition between flight phases. The first transition (on pad → thrust) is provided in a `switch`-`case` statement. Switch case is analogous to multiple if/elseif statements. 

NOTE: Your altimeter will record flight phase for post-flight analysis, but will not use it for any in-flight purpose. Flight phase information *could* be used to perform events during flight, such as parachute deployment or turning off data recording after the rocket lands on the ground. 

### bench test 1
Test the altimeter's sensors. Observe/record stationary *and* accelerating outputs in all 6 principal orientations to ensure accelerometer output matches your expectation. Move your altimeter up and down to check barometer readings. Show that your data collection works—record a csv with bench test data. Show that your sensors work—create plots with matlab. 

### bench test 2
Test the altimeter's sensors through a flight-like scenario:
- stationary and upright
- accelerate upward
- reach apogee
- deploy nosecone
- nosecone hangs from parachute (points downward)
- rocket comes to rest on ground

Plot the results correctly accounting for any -1/0/1 g discrepancies. 

### stair test
Demonstrate that your altimeter can operate on battery power and accurately record an altitude change *greater than* 10 m. You will need to use an external source to compare your altitude change. Document your external source appropriately (e.g. screenshots, not USAFA documentation statement). 

Describe all results in a brief test document. 
### submission
- [ ] modified code with flight phase logic
- [ ] recorded data files
- [ ] analysis script(s)
- [ ] plot image files
- [ ] photo/screenshot of external altitude validation
- [ ] brief report (test_report_altimeter.md) 
	-  report will be grade for writing quality


# RA3 peer review
You will provide feedback on a classmate's paper. Your feedback will be graded as an assignment. 

# RA4 paper sections

Write instrumentation section of your report in overleaf. 
- describe instrumentation
- describe phase transition logic
- briefly present instrumentation test results

### submission
- [ ] update paper on overleaf
  - [ ] paste link here: (your overleaf share link)
  - (ensure the link is a share link, not just the URL in your browser)

- [ ] include the report as a pdf in this project's folder
- [ ] bring to class 2 printed copies of current paperon due date



# project directions

## assumptions

Your altimeter will record an MSL altitude, which will be wrong since you will not calibrate the pressure altitude at the time of launch. Since you only care about AGL altitude, you can ignore pressure altitude and simply subtract the start-of-flight altitude. 

## required software

- arduino IDE with the following (see [/tools.md](../../tools.md) for installation instructions) 
  - board definitions: RP2040 from Earle Philhower (`https://github.com/earlephilhower/arduino-pico/releases/download/global/package_rp2040_index.json`)
  - libraries
    - Adafruit BMP280
    - Adafruit BNO08x
    - library "SdFat - Adafruit Fork" by Bill Greiman
    - Adafruit neopixel
- provided arduino files
  - [05_rocket_altimeter.ino](05_rocket_altimeter.ino)
  - [setup_functions.ino](setup_functions.ino)
  - [error.ino](errors.ino)

## required hardware

- RP2040 Adalogger [datasheet](./datasheets/adafruit-feather-rp2040-adalogger.pdf) [website](https://learn.adafruit.com/adafruit-feather-rp2040-adalogger)
- battery [datasheet](./datasheets/battery.pdf) [website](https://www.adafruit.com/product/3898)
- BNO085 IMU [datasheet](./datasheets/BNO085%20IMU%20sensor.pdf) [website](https://www.adafruit.com/product/4754)
- BMP280 pressure sensor [datasheet](./datasheets/BMP280-barometric-pressure-plus-temperature-sensor-breakout.pdf) [website](https://www.adafruit.com/product/2652)
- QWIIC cables
- USB cable
- microSD card (and reader)

## prepare SD card

Using a USB SD card reader, format your SD card with FAT32. 

- Windows Explorer
- right click the drive
- Format
- FAT32
- (give it a name)
- OK

Remove the card and insert it into your microcontroller. 

## Upload code

Upload your code by pressing the upload button in Arduino IDE. When you press upload, Arduino will compile your program and upload it to your microcontroller. The compile process may take several minutes. 

If the upload fails, try again with the 'boot' button. Hold down the microcontroller's 'boot' button until Arduino IDE indicates that upload has started. 

> [!NOTE]
>
> You only need to upload your code once (and after any changes to your code). At every powerup, your arduino will run its current program. 


## bench test 

Perform a quick bench test of your altimeter to ensure it reads correctly. 

Open Arduino IDE and connect your arduino to your computer. Ensure the correct board and port is selected. Open a serial monitor—you should see streaming data. 

Open a serial plotter. You should see checkboxes for the different data points. Time (in milliseconds) will quickly outrange any other data, so turn it off with its checkbox. 

To check the barometric altimeter, select only altitude and raise and lower your altimeter. You should be able to see the changing output. 

To check the IMU accelerometer outputs, select only accelerations. You should see changing accelerations as you wave the altimeter around in varying orientations. 

Remove power from your arduino. Connect the battery and repeat the same bench test. 

Carefully remove the battery from your arduino and remove the SD card. Check the contents of the SD card to ensure you recorded data correctly. 

## objectives

- introduction to microcontroller programming 
- ensure altimeter and accelerometer are sufficient to capture rocket launch data
  - must demonstrate measurement of altitude change greater than 10 m

- plan and perform data analysis

Include a comparison between your actual and expected accelerations. Provide a plot and brief sentence/paragraph analysis. 

Include a comparison between your actual and expected altitudes. Provide a plot and brief sentence/paragraph analysis. 



