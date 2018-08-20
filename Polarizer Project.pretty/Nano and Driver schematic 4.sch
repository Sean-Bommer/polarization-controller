EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Nano and Driver schematic-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ArduinoNano U1
U 1 1 5B3603A6
P 4850 3300
F 0 "U1" H 4850 2450 60  0000 C CNN
F 1 "ArduinoNano" H 4850 4150 60  0000 C CNN
F 2 "Modules:Arduino_Nano" H 5200 3200 60  0001 C CNN
F 3 "" H 5200 3200 60  0001 C CNN
	1    4850 3300
	-1   0    0    1   
$EndComp
$Comp
L DRV8834_LV U2
U 1 1 5B36050B
P 6450 2800
F 0 "U2" H 6450 3250 60  0000 C CNN
F 1 "DRV8834_LV" H 6450 2350 60  0000 C CNN
F 2 "Polarizer Project:drv8834" H 6650 2700 60  0001 C CNN
F 3 "" H 6650 2700 60  0001 C CNN
	1    6450 2800
	1    0    0    -1  
$EndComp
$Comp
L DRV8834_LV U3
U 1 1 5B360579
P 6450 3800
F 0 "U3" H 6450 4250 60  0000 C CNN
F 1 "DRV8834_LV" H 6450 3350 60  0000 C CNN
F 2 "Polarizer Project:drv8834" H 6650 3700 60  0001 C CNN
F 3 "" H 6650 3700 60  0001 C CNN
	1    6450 3800
	1    0    0    -1  
$EndComp
$Comp
L CP1 100uf1
U 1 1 5B360C92
P 7500 2400
F 0 "100uf1" H 7525 2500 50  0000 L CNN
F 1 "CP1" H 7525 2300 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.50mm" H 7500 2400 50  0001 C CNN
F 3 "" H 7500 2400 50  0001 C CNN
	1    7500 2400
	1    0    0    -1  
$EndComp
$Comp
L CP1 100uf2
U 1 1 5B360D13
P 7500 3400
F 0 "100uf2" H 7525 3500 50  0000 L CNN
F 1 "CP1" H 7525 3300 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.50mm" H 7500 3400 50  0001 C CNN
F 3 "" H 7500 3400 50  0001 C CNN
	1    7500 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5B36011A
P 7850 2550
F 0 "#PWR01" H 7850 2300 50  0001 C CNN
F 1 "GND" H 7850 2400 50  0000 C CNN
F 2 "" H 7850 2550 50  0001 C CNN
F 3 "" H 7850 2550 50  0001 C CNN
	1    7850 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5B36013B
P 7850 3550
F 0 "#PWR02" H 7850 3300 50  0001 C CNN
F 1 "GND" H 7850 3400 50  0000 C CNN
F 2 "" H 7850 3550 50  0001 C CNN
F 3 "" H 7850 3550 50  0001 C CNN
	1    7850 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5B360556
P 7100 3150
F 0 "#PWR03" H 7100 2900 50  0001 C CNN
F 1 "GND" H 7100 3000 50  0000 C CNN
F 2 "" H 7100 3150 50  0001 C CNN
F 3 "" H 7100 3150 50  0001 C CNN
	1    7100 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5B36058E
P 7100 4150
F 0 "#PWR04" H 7100 3900 50  0001 C CNN
F 1 "GND" H 7100 4000 50  0000 C CNN
F 2 "" H 7100 4150 50  0001 C CNN
F 3 "" H 7100 4150 50  0001 C CNN
	1    7100 4150
	1    0    0    -1  
$EndComp
Text Label 7850 3250 2    60   ~ 0
VMOT
Text Label 7850 2250 2    60   ~ 0
VMOT
$Comp
L Screw_Terminal_01x05 J1
U 1 1 5B3653D2
P 8200 2850
F 0 "J1" H 8200 3150 50  0000 C CNN
F 1 "Screw_Terminal_01x05" H 8700 2650 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-5_P5.08mm" H 8200 2850 50  0001 C CNN
F 3 "" H 8200 2850 50  0001 C CNN
	1    8200 2850
	1    0    0    -1  
$EndComp
$Comp
L Screw_Terminal_01x05 J2
U 1 1 5B36555A
P 8200 3850
F 0 "J2" H 8200 4150 50  0000 C CNN
F 1 "Screw_Terminal_01x05" H 8700 3650 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-5_P5.08mm" H 8200 3850 50  0001 C CNN
F 3 "" H 8200 3850 50  0001 C CNN
	1    8200 3850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5B36705B
P 4050 4000
F 0 "#PWR05" H 4050 3750 50  0001 C CNN
F 1 "GND" H 4050 3850 50  0000 C CNN
F 2 "" H 4050 4000 50  0001 C CNN
F 3 "" H 4050 4000 50  0001 C CNN
	1    4050 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5B4F5160
P 5500 4250
F 0 "#PWR06" H 5500 4000 50  0001 C CNN
F 1 "GND" H 5500 4100 50  0000 C CNN
F 2 "" H 5500 4250 50  0001 C CNN
F 3 "" H 5500 4250 50  0001 C CNN
	1    5500 4250
	1    0    0    -1  
$EndComp
$Comp
L Jack-DC J3
U 1 1 5B4F59B8
P 3450 3800
F 0 "J3" H 3450 4010 50  0000 C CNN
F 1 "Jack-DC" H 3450 3625 50  0000 C CNN
F 2 "Connectors:BARREL_JACK" H 3500 3760 50  0001 C CNN
F 3 "" H 3500 3760 50  0001 C CNN
	1    3450 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4150 5900 4150
Wire Wire Line
	5650 4050 5900 4050
Wire Wire Line
	5700 3650 5900 3650
Wire Wire Line
	5750 3550 5900 3550
Wire Wire Line
	5750 2650 5900 2650
Wire Wire Line
	5650 2550 5900 2550
Wire Wire Line
	7000 2550 8000 2550
Wire Wire Line
	7000 3450 7350 3450
Wire Wire Line
	7000 3550 8000 3550
Connection ~ 7500 3550
Connection ~ 7500 2550
Wire Wire Line
	7000 2450 7350 2450
Wire Wire Line
	7350 2450 7350 2250
Wire Wire Line
	7350 3450 7350 3250
Wire Wire Line
	7000 3150 7100 3150
Wire Wire Line
	7350 3250 9250 3250
Connection ~ 7500 2250
Connection ~ 7500 3250
Wire Wire Line
	7000 2650 7500 2650
Wire Wire Line
	7500 2650 7500 2750
Wire Wire Line
	7500 2750 8000 2750
Wire Wire Line
	7000 2750 7450 2750
Wire Wire Line
	7450 2750 7450 2850
Wire Wire Line
	7450 2850 8000 2850
Wire Wire Line
	7000 2850 7400 2850
Wire Wire Line
	7400 2850 7400 2950
Wire Wire Line
	7400 2950 8000 2950
Wire Wire Line
	7000 2950 7350 2950
Wire Wire Line
	7350 2950 7350 3050
Wire Wire Line
	7350 3050 8000 3050
Wire Wire Line
	7000 3650 7500 3650
Wire Wire Line
	7500 3650 7500 3750
Wire Wire Line
	7500 3750 8000 3750
Wire Wire Line
	7000 3750 7450 3750
Wire Wire Line
	7450 3750 7450 3850
Wire Wire Line
	7450 3850 8000 3850
Wire Wire Line
	7000 3850 7400 3850
Wire Wire Line
	7400 3850 7400 3950
Wire Wire Line
	7400 3950 8000 3950
Wire Wire Line
	7000 3950 7350 3950
Wire Wire Line
	7350 3950 7350 4050
Wire Wire Line
	7350 4050 8000 4050
Wire Wire Line
	7000 4150 7100 4150
Wire Wire Line
	3750 3900 4250 3900
Wire Wire Line
	4050 3900 4050 4000
Wire Wire Line
	4050 2250 4050 3700
Wire Wire Line
	3750 3700 4250 3700
Wire Wire Line
	5450 2600 5650 2600
Wire Wire Line
	5450 2700 5750 2700
Wire Wire Line
	5450 2800 5850 2800
Wire Wire Line
	5650 2600 5650 2550
Wire Wire Line
	5750 2700 5750 2650
Wire Wire Line
	5850 2800 5850 3050
Wire Wire Line
	5850 3050 5900 3050
Wire Wire Line
	5450 2900 5800 2900
Wire Wire Line
	5800 2900 5800 3150
Wire Wire Line
	5800 3150 5900 3150
Wire Wire Line
	5450 3100 5750 3100
Wire Wire Line
	5750 3100 5750 3550
Wire Wire Line
	5450 3200 5700 3200
Wire Wire Line
	5700 3200 5700 3650
Wire Wire Line
	5450 3300 5650 3300
Wire Wire Line
	5650 3300 5650 4050
Wire Wire Line
	5450 3400 5550 3400
Wire Wire Line
	5550 3400 5550 4150
Wire Wire Line
	5450 3700 5500 3700
Wire Wire Line
	5500 3700 5500 4250
Connection ~ 7350 2250
Connection ~ 4050 3700
Wire Wire Line
	3750 3800 3750 3900
Connection ~ 4050 3900
Wire Wire Line
	8000 2550 8000 2650
Connection ~ 7850 2550
Wire Wire Line
	8000 3550 8000 3650
Connection ~ 7850 3550
Wire Wire Line
	4050 2250 9250 2250
Wire Wire Line
	9250 2250 9250 3250
Wire Wire Line
	5450 3000 5750 3000
Connection ~ 5750 3000
Wire Wire Line
	5750 3950 5900 3950
Wire Wire Line
	5900 2950 5750 2950
Wire Wire Line
	5750 2950 5750 3950
$EndSCHEMATC
