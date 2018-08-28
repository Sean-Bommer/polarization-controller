# polarization-controller-Unit
Repository for all the final files of the polarization controller project completed by Sean Bommer.

The polarization controller unit (PCU) is a modular laser cut device that is capable of rotating 2 1-inch polarizing waveplates.
it operates using an Arduino Nano and two DRV8834 stepper motor drivers, found at the folowing link.
https://www.pololu.com/product/2134
which control 2 28BYJ-48 5V Stepper Motors.
the construction is made up from 3mm acrylic and M3 bolts and nuts.

The PCU can be powered from the 5V line of the Arduino Nano, which allowing for the whole system to be run from the USB port of a PC.
The OS for the device is contained in the Arduino IDE code in this repository, two versions are available:
  
  The 'position' version sets the start location (it's position when switched on) as position = 0 Degrees and then rotates the waveplate     to  the target orientation with respect to this 0 position. For example, upon start up the device is asked to rotate to 90 degrees. the   device turns to this position. it is then asked to turn to 90 degrees again. the device does not move, as it is already at 90 degrees.
  
  The 'distance' version reads the degrees input as how far it should rotate. For example, upon start up the device is asked to rotate 90   degrees. the device turns this distance. it is then asked to turn 90 degrees again. the device will turn another 90 degrees, thus being   180 degrees from it's origin point.
  
This device is designed to be very modular, and complies to the dimensions required for the Thorlabs cage mount system. the waveplates are controlled independently of each other so it can operate with either one or 2 waveplates. 

When attached to the base mount via the M3 screws the, the whole system can be mounted to an optical breadboard via the 2 slots either side of the base and up to 4 L-shaped mounting brackets. In this configuration, with two waveplates setup, the PCU can serve as a mounting point for a simple optical cage setup as well.
