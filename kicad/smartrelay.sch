EESchema Schematic File Version 2
LIBS:power
LIBS:device
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
LIBS:74xgxx
LIBS:ac-dc
LIBS:actel
LIBS:allegro
LIBS:Altera
LIBS:analog_devices
LIBS:battery_management
LIBS:bbd
LIBS:bosch
LIBS:brooktre
LIBS:cmos_ieee
LIBS:dc-dc
LIBS:diode
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:ir
LIBS:Lattice
LIBS:leds
LIBS:logo
LIBS:maxim
LIBS:mechanical
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic24mcu
LIBS:microchip_pic32mcu
LIBS:modules
LIBS:motor_drivers
LIBS:motors
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:Oscillators
LIBS:Power_Management
LIBS:powerint
LIBS:pspice
LIBS:references
LIBS:relays
LIBS:rfcom
LIBS:sensors
LIBS:silabs
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:transf
LIBS:triac_thyristor
LIBS:ttl_ieee
LIBS:video
LIBS:wiznet
LIBS:Worldsemi
LIBS:Xicor
LIBS:zetex
LIBS:Zilog
LIBS:ArduinoNano
LIBS:LatchingDualCoilRelay
LIBS:smartrelay-cache
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
L TSOP382xx U1
U 1 1 59AE1C61
P 5700 5000
F 0 "U1" H 5300 5300 50  0000 L CNN
F 1 "TSOP38338" H 5300 4700 50  0000 L CNN
F 2 "Opto-Devices:IRReceiver_Vishay_MINICAST-3pin" H 5650 4625 50  0001 C CNN
F 3 "" H 6350 5300 50  0000 C CNN
	1    5700 5000
	1    0    0    -1  
$EndComp
$Comp
L ArduinoNano U2
U 1 1 59AE2E23
P 6450 3100
F 0 "U2" H 6000 4000 50  0000 C CNN
F 1 "ArduinoNano" H 6200 2200 50  0000 C CNN
F 2 "" H 5550 2150 50  0001 C CNN
F 3 "https://store.arduino.cc/usa/arduino-nano" H 6250 2050 50  0001 C CNN
	1    6450 3100
	1    0    0    -1  
$EndComp
$Comp
L LD271 D1
U 1 1 59AE2EE3
P 7100 5200
F 0 "D1" H 7120 5270 50  0000 L CNN
F 1 "IR1503" H 7060 5090 50  0000 C CNN
F 2 "LEDs:LED_D2.0mm_W4.8mm_H2.5mm_FlatTop" H 7100 5375 50  0001 C CNN
F 3 "" H 7050 5200 50  0000 C CNN
	1    7100 5200
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 59AE2F4D
P 7100 4850
F 0 "R3" V 7180 4850 50  0000 C CNN
F 1 "62R" V 7100 4850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7030 4850 50  0001 C CNN
F 3 "" H 7100 4850 50  0001 C CNN
	1    7100 4850
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 59AE2F9E
P 6550 5700
F 0 "R2" V 6630 5700 50  0000 C CNN
F 1 "1k" V 6550 5700 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6480 5700 50  0001 C CNN
F 3 "" H 6550 5700 50  0001 C CNN
	1    6550 5700
	0    1    1    0   
$EndComp
$Comp
L MMBT3904 Q2
U 1 1 59AE2FD6
P 7000 5700
F 0 "Q2" H 7200 5775 50  0000 L CNN
F 1 "2N3904" H 7200 5700 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 7200 5625 50  0001 L CIN
F 3 "" H 7000 5700 50  0001 L CNN
	1    7000 5700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 59AE3174
P 7100 6000
F 0 "#PWR01" H 7100 5750 50  0001 C CNN
F 1 "GND" H 7100 5850 50  0000 C CNN
F 2 "" H 7100 6000 50  0001 C CNN
F 3 "" H 7100 6000 50  0001 C CNN
	1    7100 6000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 59AE32BD
P 6200 5200
F 0 "#PWR02" H 6200 4950 50  0001 C CNN
F 1 "GND" H 6200 5050 50  0000 C CNN
F 2 "" H 6200 5200 50  0001 C CNN
F 3 "" H 6200 5200 50  0001 C CNN
	1    6200 5200
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR03
U 1 1 59AE32EC
P 6200 4800
F 0 "#PWR03" H 6200 4650 50  0001 C CNN
F 1 "+5V" H 6200 4940 50  0000 C CNN
F 2 "" H 6200 4800 50  0001 C CNN
F 3 "" H 6200 4800 50  0001 C CNN
	1    6200 4800
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR04
U 1 1 59AE3323
P 7100 4600
F 0 "#PWR04" H 7100 4450 50  0001 C CNN
F 1 "+5V" H 7100 4740 50  0000 C CNN
F 2 "" H 7100 4600 50  0001 C CNN
F 3 "" H 7100 4600 50  0001 C CNN
	1    7100 4600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR05
U 1 1 59AE36A3
P 7350 2700
F 0 "#PWR05" H 7350 2550 50  0001 C CNN
F 1 "+5V" H 7350 2840 50  0000 C CNN
F 2 "" H 7350 2700 50  0001 C CNN
F 3 "" H 7350 2700 50  0001 C CNN
	1    7350 2700
	0    1    1    0   
$EndComp
$Comp
L GND #PWR06
U 1 1 59AE36D5
P 7350 2500
F 0 "#PWR06" H 7350 2250 50  0001 C CNN
F 1 "GND" H 7350 2350 50  0000 C CNN
F 2 "" H 7350 2500 50  0001 C CNN
F 3 "" H 7350 2500 50  0001 C CNN
	1    7350 2500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR07
U 1 1 59AE3708
P 5550 2650
F 0 "#PWR07" H 5550 2400 50  0001 C CNN
F 1 "GND" H 5550 2500 50  0000 C CNN
F 2 "" H 5550 2650 50  0001 C CNN
F 3 "" H 5550 2650 50  0001 C CNN
	1    5550 2650
	0    1    1    0   
$EndComp
Text Label 6300 5000 0    50   ~ 0
IR_RECV
Text Label 5450 2800 2    50   ~ 0
IR_RECV
Text Label 6300 5700 2    50   ~ 0
IR_SEND
Text Label 5450 2900 2    50   ~ 0
IR_SEND
Text Label 5450 3000 2    50   ~ 0
RELAY_CTRL_A_SET
$Comp
L Screw_Terminal_1x03 J1
U 1 1 59AF6154
P 750 2650
F 0 "J1" H 750 3000 50  0000 C TNN
F 1 "OSTYK42103030" V 600 2650 50  0000 C TNN
F 2 "conn_barrier:CONN_BARRIER_STRIP_3CIRC_0.325in" H 750 2325 50  0001 C CNN
F 3 "" H 725 2750 50  0001 C CNN
	1    750  2650
	1    0    0    -1  
$EndComp
$Comp
L Screw_Terminal_1x03 J2
U 1 1 59AF61B9
P 2050 2650
F 0 "J2" H 2050 3000 50  0000 C TNN
F 1 "OSTYK42103030" V 1900 2650 50  0000 C TNN
F 2 "conn_barrier:CONN_BARRIER_STRIP_3CIRC_0.325in" H 2050 2325 50  0001 C CNN
F 3 "" H 2025 2750 50  0001 C CNN
	1    2050 2650
	-1   0    0    1   
$EndComp
Text Label 1050 2850 0    50   ~ 0
LiveIn
Text Label 1750 2850 2    50   ~ 0
LiveOutA
Text Label 5550 3800 2    50   ~ 0
MISO
Text Label 5550 3700 2    50   ~ 0
MOSI
Text Label 7250 2600 0    50   ~ 0
RST
Text Label 7350 3800 0    50   ~ 0
SCK
$Comp
L Battery_Cell BT1
U 1 1 59AF79DA
P 4800 1250
F 0 "BT1" H 4900 1350 50  0000 L CNN
F 1 "Battery_Cell" H 4900 1250 50  0000 L CNN
F 2 "" V 4800 1310 50  0001 C CNN
F 3 "" V 4800 1310 50  0001 C CNN
	1    4800 1250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 59AF7ABD
P 4800 1450
F 0 "#PWR012" H 4800 1200 50  0001 C CNN
F 1 "GND" H 4800 1300 50  0000 C CNN
F 2 "" H 4800 1450 50  0001 C CNN
F 3 "" H 4800 1450 50  0001 C CNN
	1    4800 1450
	1    0    0    -1  
$EndComp
$Comp
L MCP1640-CH U3
U 1 1 59B05EE7
P 6200 1100
F 0 "U3" H 5900 1525 50  0000 L CNN
F 1 "MCP16251T-I/CH" H 5900 1450 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6" H 6200 600 50  0001 C CIN
F 3 "" H 5950 1550 50  0001 C CNN
	1    6200 1100
	1    0    0    -1  
$EndComp
Text Label 5300 1000 2    50   ~ 0
+1.2V
$Comp
L GND #PWR013
U 1 1 59B05FE3
P 6200 1500
F 0 "#PWR013" H 6200 1250 50  0001 C CNN
F 1 "GND" H 6200 1350 50  0000 C CNN
F 2 "" H 6200 1500 50  0001 C CNN
F 3 "" H 6200 1500 50  0001 C CNN
	1    6200 1500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR014
U 1 1 59B06033
P 7650 1100
F 0 "#PWR014" H 7650 950 50  0001 C CNN
F 1 "+5V" H 7650 1240 50  0000 C CNN
F 2 "" H 7650 1100 50  0001 C CNN
F 3 "" H 7650 1100 50  0001 C CNN
	1    7650 1100
	0    1    1    0   
$EndComp
$Comp
L L L1
U 1 1 59B06085
P 6750 900
F 0 "L1" V 6700 900 50  0000 C CNN
F 1 "4.7uH" V 6825 900 50  0000 C CNN
F 2 "" H 6750 900 50  0001 C CNN
F 3 "" H 6750 900 50  0001 C CNN
	1    6750 900 
	0    1    1    0   
$EndComp
Text Label 6900 900  0    50   ~ 0
+1.2V
$Comp
L C C1
U 1 1 59B06606
P 4550 1200
F 0 "C1" H 4575 1300 50  0000 L CNN
F 1 "4.7uF" H 4575 1100 50  0000 L CNN
F 2 "Capacitors_THT:C_Axial_L3.8mm_D2.6mm_P7.50mm_Horizontal" H 4588 1050 50  0001 C CNN
F 3 "" H 4550 1200 50  0001 C CNN
	1    4550 1200
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 59B0AA2A
P 6750 1300
F 0 "R4" V 6830 1300 50  0000 C CNN
F 1 "3.09M" V 6750 1300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6680 1300 50  0001 C CNN
F 3 "" H 6750 1300 50  0001 C CNN
	1    6750 1300
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 59B0AA65
P 6750 1700
F 0 "R5" V 6830 1700 50  0000 C CNN
F 1 "1M" V 6750 1700 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6680 1700 50  0001 C CNN
F 3 "" H 6750 1700 50  0001 C CNN
	1    6750 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 59B0AD51
P 6750 1850
F 0 "#PWR015" H 6750 1600 50  0001 C CNN
F 1 "GND" H 6750 1700 50  0000 C CNN
F 2 "" H 6750 1850 50  0001 C CNN
F 3 "" H 6750 1850 50  0001 C CNN
	1    6750 1850
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 59B0AD9E
P 7000 1300
F 0 "C2" H 7025 1400 50  0000 L CNN
F 1 "10uF" H 7025 1200 50  0000 L CNN
F 2 "Capacitors_THT:C_Axial_L3.8mm_D2.6mm_P7.50mm_Horizontal" H 7038 1150 50  0001 C CNN
F 3 "" H 7000 1300 50  0001 C CNN
	1    7000 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 59B0ADDF
P 7000 1450
F 0 "#PWR016" H 7000 1200 50  0001 C CNN
F 1 "GND" H 7000 1300 50  0000 C CNN
F 2 "" H 7000 1450 50  0001 C CNN
F 3 "" H 7000 1450 50  0001 C CNN
	1    7000 1450
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 59B0B71B
P 7250 1300
F 0 "C3" H 7275 1400 50  0000 L CNN
F 1 "10uF" H 7275 1200 50  0000 L CNN
F 2 "Capacitors_THT:C_Axial_L3.8mm_D2.6mm_P7.50mm_Horizontal" H 7288 1150 50  0001 C CNN
F 3 "" H 7250 1300 50  0001 C CNN
	1    7250 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 59B0B75A
P 7250 1450
F 0 "#PWR017" H 7250 1200 50  0001 C CNN
F 1 "GND" H 7250 1300 50  0000 C CNN
F 2 "" H 7250 1450 50  0001 C CNN
F 3 "" H 7250 1450 50  0001 C CNN
	1    7250 1450
	1    0    0    -1  
$EndComp
Text Label 7350 3500 0    50   ~ 0
+1.2V
$Comp
L MMBT3904 Q?
U 1 1 59F2AD07
P 9150 3050
F 0 "Q?" H 9350 3125 50  0000 L CNN
F 1 "2N3904" H 9350 3050 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 9350 2975 50  0001 L CIN
F 3 "" H 9150 3050 50  0001 L CNN
	1    9150 3050
	-1   0    0    1   
$EndComp
$Comp
L MMBT3904 Q?
U 1 1 59F2AE20
P 9650 3050
F 0 "Q?" H 9850 3125 50  0000 L CNN
F 1 "2N3904" H 9850 3050 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 9850 2975 50  0001 L CIN
F 3 "" H 9650 3050 50  0001 L CNN
	1    9650 3050
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 59F2AFA6
P 9050 2600
F 0 "R?" V 9130 2600 50  0000 C CNN
F 1 "680k" V 9050 2600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 8980 2600 50  0001 C CNN
F 3 "" H 9050 2600 50  0001 C CNN
	1    9050 2600
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 59F2B03D
P 9750 2600
F 0 "R?" V 9830 2600 50  0000 C CNN
F 1 "4.7k" V 9750 2600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 9680 2600 50  0001 C CNN
F 3 "" H 9750 2600 50  0001 C CNN
	1    9750 2600
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 59F2B1E4
P 8500 3000
F 0 "C?" H 8525 3100 50  0000 L CNN
F 1 "100nF" H 8525 2900 50  0000 L CNN
F 2 "Capacitors_THT:C_Axial_L3.8mm_D2.6mm_P7.50mm_Horizontal" H 8538 2850 50  0001 C CNN
F 3 "" H 8500 3000 50  0001 C CNN
	1    8500 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 59F2B2E6
P 8500 3150
F 0 "#PWR?" H 8500 2900 50  0001 C CNN
F 1 "GND" H 8500 3000 50  0000 C CNN
F 2 "" H 8500 3150 50  0001 C CNN
F 3 "" H 8500 3150 50  0001 C CNN
	1    8500 3150
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 59F2B4E2
P 9750 3500
F 0 "R?" V 9830 3500 50  0000 C CNN
F 1 "1k" V 9750 3500 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 9680 3500 50  0001 C CNN
F 3 "" H 9750 3500 50  0001 C CNN
	1    9750 3500
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 59F2B5C9
P 10050 3500
F 0 "C?" H 10075 3600 50  0000 L CNN
F 1 "10uF" H 10075 3400 50  0000 L CNN
F 2 "Capacitors_THT:C_Axial_L3.8mm_D2.6mm_P7.50mm_Horizontal" H 10088 3350 50  0001 C CNN
F 3 "" H 10050 3500 50  0001 C CNN
	1    10050 3500
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 59F2B794
P 10300 2800
F 0 "C?" H 10325 2900 50  0000 L CNN
F 1 "10uF" H 10325 2700 50  0000 L CNN
F 2 "Capacitors_THT:C_Axial_L3.8mm_D2.6mm_P7.50mm_Horizontal" H 10338 2650 50  0001 C CNN
F 3 "" H 10300 2800 50  0001 C CNN
	1    10300 2800
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 59F2BD59
P 10450 3250
F 0 "R?" V 10530 3250 50  0000 C CNN
F 1 "100k" V 10450 3250 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 10380 3250 50  0001 C CNN
F 3 "" H 10450 3250 50  0001 C CNN
	1    10450 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 59F2BF06
P 10450 3650
F 0 "#PWR?" H 10450 3400 50  0001 C CNN
F 1 "GND" H 10450 3500 50  0000 C CNN
F 2 "" H 10450 3650 50  0001 C CNN
F 3 "" H 10450 3650 50  0001 C CNN
	1    10450 3650
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 59F2BF54
P 9050 2450
F 0 "#PWR?" H 9050 2300 50  0001 C CNN
F 1 "+5V" H 9050 2590 50  0000 C CNN
F 2 "" H 9050 2450 50  0001 C CNN
F 3 "" H 9050 2450 50  0001 C CNN
	1    9050 2450
	1    0    0    -1  
$EndComp
Text Label 10600 2800 0    50   ~ 0
NOISE
Text Label 7350 3400 0    50   ~ 0
NOISE
Wire Wire Line
	7100 5000 7100 5100
Wire Wire Line
	7100 5400 7100 5500
Wire Wire Line
	7100 5900 7100 6000
Wire Wire Line
	6800 5700 6700 5700
Wire Wire Line
	6200 5200 6100 5200
Wire Wire Line
	6200 4800 6100 4800
Wire Wire Line
	7100 4600 7100 4700
Wire Wire Line
	7350 2700 7250 2700
Wire Wire Line
	7350 2500 7250 2500
Wire Wire Line
	6100 5000 6300 5000
Wire Wire Line
	5650 2800 5450 2800
Wire Wire Line
	6400 5700 6300 5700
Wire Wire Line
	5650 2900 5450 2900
Wire Wire Line
	5600 2650 5550 2650
Wire Wire Line
	5600 2650 5600 2700
Wire Wire Line
	5600 2700 5650 2700
Wire Wire Line
	5650 3000 5450 3000
Wire Wire Line
	950  2450 1850 2450
Wire Wire Line
	950  2650 1850 2650
Wire Wire Line
	950  2850 1050 2850
Wire Wire Line
	1850 2850 1750 2850
Wire Wire Line
	5650 3800 5550 3800
Wire Wire Line
	5650 3700 5550 3700
Wire Wire Line
	7250 3800 7350 3800
Wire Wire Line
	4800 1000 4800 1050
Wire Wire Line
	6600 1100 7650 1100
Wire Wire Line
	4800 1350 4800 1450
Connection ~ 4800 1000
Connection ~ 4800 1400
Wire Wire Line
	6600 1200 6600 1500
Wire Wire Line
	6750 1450 6750 1550
Wire Wire Line
	6600 1500 6750 1500
Connection ~ 6750 1500
Wire Wire Line
	7000 1150 7000 1100
Connection ~ 7000 1100
Wire Wire Line
	6750 1150 6750 1100
Connection ~ 6750 1100
Wire Wire Line
	7250 1150 7250 1100
Connection ~ 7250 1100
Wire Wire Line
	5350 1000 5350 1200
Connection ~ 5350 1000
Wire Wire Line
	5350 1200 5800 1200
Wire Wire Line
	7250 3500 7350 3500
Wire Wire Line
	4550 1400 4800 1400
Wire Wire Line
	9350 3050 9450 3050
Wire Wire Line
	8500 2850 9050 2850
Wire Wire Line
	9050 2850 9050 2750
Wire Wire Line
	9050 2450 9750 2450
Wire Wire Line
	9750 2750 9750 2850
Wire Wire Line
	10050 3350 9750 3350
Wire Wire Line
	9750 3350 9750 3250
Wire Wire Line
	9750 3650 10450 3650
Wire Wire Line
	9750 2800 10150 2800
Connection ~ 9750 2800
Wire Wire Line
	10450 3100 10450 2800
Wire Wire Line
	10450 3650 10450 3400
Connection ~ 10050 3650
Wire Wire Line
	10450 2800 10600 2800
Wire Wire Line
	7250 3400 7350 3400
Wire Wire Line
	5650 3100 5450 3100
Text Label 5450 3100 2    50   ~ 0
RELAY_CTRL_B_SET
$Comp
L Screw_Terminal_1x03 J?
U 1 1 59F2F6AE
P 2050 3750
F 0 "J?" H 2050 4100 50  0000 C TNN
F 1 "OSTYK42103030" V 1900 3750 50  0000 C TNN
F 2 "conn_barrier:CONN_BARRIER_STRIP_3CIRC_0.325in" H 2050 3425 50  0001 C CNN
F 3 "" H 2025 3850 50  0001 C CNN
	1    2050 3750
	-1   0    0    1   
$EndComp
Text Label 1750 3950 2    50   ~ 0
LiveOutB
Wire Wire Line
	1850 3950 1750 3950
Wire Wire Line
	1600 2450 1600 3550
Wire Wire Line
	1600 3550 1850 3550
Connection ~ 1600 2450
Wire Wire Line
	1400 2650 1400 3750
Wire Wire Line
	1400 3750 1850 3750
Connection ~ 1400 2650
$Comp
L C C?
U 1 1 5A052D92
P 7500 1300
F 0 "C?" H 7525 1400 50  0000 L CNN
F 1 "2200uF" H 7525 1200 50  0000 L CNN
F 2 "Capacitors_THT:C_Axial_L3.8mm_D2.6mm_P7.50mm_Horizontal" H 7538 1150 50  0001 C CNN
F 3 "" H 7500 1300 50  0001 C CNN
F 4 "10V" H 7598 1300 60  0000 L CNN "Voltage"
	1    7500 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1150 7500 1100
Connection ~ 7500 1100
$Comp
L GND #PWR?
U 1 1 5A05366D
P 7500 1450
F 0 "#PWR?" H 7500 1200 50  0001 C CNN
F 1 "GND" H 7500 1300 50  0000 C CNN
F 2 "" H 7500 1450 50  0001 C CNN
F 3 "" H 7500 1450 50  0001 C CNN
	1    7500 1450
	1    0    0    -1  
$EndComp
$Comp
L G5RL-K1A-E RL?
U 1 1 5A053125
P 2900 5300
F 0 "RL?" H 3450 5650 50  0000 L CNN
F 1 "G5RL-K1A-E" H 3450 5550 50  0000 L CNN
F 2 "" H 3450 5450 50  0001 L CNN
F 3 "" H 3100 5900 50  0000 C CNN
	1    2900 5300
	1    0    0    -1  
$EndComp
Text Label 3250 5400 3    50   ~ 0
LiveIn
Text Label 3250 4800 1    50   ~ 0
LiveOutA
$Comp
L +5V #PWR?
U 1 1 5A0541D1
P 2600 5100
F 0 "#PWR?" H 2600 4950 50  0001 C CNN
F 1 "+5V" H 2600 5240 50  0000 C CNN
F 2 "" H 2600 5100 50  0001 C CNN
F 3 "" H 2600 5100 50  0001 C CNN
	1    2600 5100
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A054829
P 1850 4750
F 0 "#PWR?" H 1850 4500 50  0001 C CNN
F 1 "GND" H 1850 4600 50  0000 C CNN
F 2 "" H 1850 4750 50  0001 C CNN
F 3 "" H 1850 4750 50  0001 C CNN
	1    1850 4750
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5A05482F
P 1900 4450
F 0 "R?" V 1980 4450 50  0000 C CNN
F 1 "1k" V 1900 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1830 4450 50  0001 C CNN
F 3 "" H 1900 4450 50  0001 C CNN
	1    1900 4450
	0    -1   -1   0   
$EndComp
Text Label 1650 4450 2    50   ~ 0
RELAY_CTRL_A_RESET
Wire Wire Line
	1850 4750 1950 4750
Wire Wire Line
	2050 4450 2150 4450
Wire Wire Line
	1750 4450 1650 4450
$Comp
L MMBT3904 Q?
U 1 1 5A054823
P 2150 4650
F 0 "Q?" V 2350 4725 50  0000 L CNN
F 1 "MMBT3904" V 2426 4729 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2350 4575 50  0001 L CIN
F 3 "" H 2150 4650 50  0001 L CNN
	1    2150 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 4750 2900 4750
Wire Wire Line
	2900 4750 2900 4800
$Comp
L MMBT3904 Q?
U 1 1 5A054E01
P 2150 5350
F 0 "Q?" V 2350 5425 50  0000 L CNN
F 1 "MMBT3904" V 2426 5429 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2350 5275 50  0001 L CIN
F 3 "" H 2150 5350 50  0001 L CNN
	1    2150 5350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A054E07
P 1850 5450
F 0 "#PWR?" H 1850 5200 50  0001 C CNN
F 1 "GND" H 1850 5300 50  0000 C CNN
F 2 "" H 1850 5450 50  0001 C CNN
F 3 "" H 1850 5450 50  0001 C CNN
	1    1850 5450
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5A054E0D
P 1900 5150
F 0 "R?" V 1980 5150 50  0000 C CNN
F 1 "1k" V 1900 5150 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1830 5150 50  0001 C CNN
F 3 "" H 1900 5150 50  0001 C CNN
	1    1900 5150
	0    -1   -1   0   
$EndComp
Text Label 1650 5150 2    50   ~ 0
RELAY_CTRL_A_SET
Wire Wire Line
	1850 5450 1950 5450
Wire Wire Line
	2050 5150 2150 5150
Wire Wire Line
	1750 5150 1650 5150
Wire Wire Line
	2250 5500 2900 5500
Wire Wire Line
	2900 5500 2900 5400
$Comp
L G5RL-K1A-E RL?
U 1 1 5A055A7F
P 2900 6900
F 0 "RL?" H 3450 7250 50  0000 L CNN
F 1 "G5RL-K1A-E" H 3450 7150 50  0000 L CNN
F 2 "" H 3450 7050 50  0001 L CNN
F 3 "" H 3100 7500 50  0000 C CNN
	1    2900 6900
	1    0    0    -1  
$EndComp
Text Label 3250 7000 3    50   ~ 0
LiveIn
Text Label 3250 6400 1    50   ~ 0
LiveOutB
$Comp
L +5V #PWR?
U 1 1 5A055A87
P 2600 6700
F 0 "#PWR?" H 2600 6550 50  0001 C CNN
F 1 "+5V" H 2600 6840 50  0000 C CNN
F 2 "" H 2600 6700 50  0001 C CNN
F 3 "" H 2600 6700 50  0001 C CNN
	1    2600 6700
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A055A8D
P 1850 6350
F 0 "#PWR?" H 1850 6100 50  0001 C CNN
F 1 "GND" H 1850 6200 50  0000 C CNN
F 2 "" H 1850 6350 50  0001 C CNN
F 3 "" H 1850 6350 50  0001 C CNN
	1    1850 6350
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5A055A93
P 1900 6050
F 0 "R?" V 1980 6050 50  0000 C CNN
F 1 "1k" V 1900 6050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1830 6050 50  0001 C CNN
F 3 "" H 1900 6050 50  0001 C CNN
	1    1900 6050
	0    -1   -1   0   
$EndComp
Text Label 1650 6050 2    50   ~ 0
RELAY_CTRL_B_RESET
Wire Wire Line
	1850 6350 1950 6350
Wire Wire Line
	2050 6050 2150 6050
Wire Wire Line
	1750 6050 1650 6050
$Comp
L MMBT3904 Q?
U 1 1 5A055A9D
P 2150 6250
F 0 "Q?" V 2350 6325 50  0000 L CNN
F 1 "MMBT3904" V 2426 6329 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2350 6175 50  0001 L CIN
F 3 "" H 2150 6250 50  0001 L CNN
	1    2150 6250
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 6350 2900 6350
Wire Wire Line
	2900 6350 2900 6400
$Comp
L MMBT3904 Q?
U 1 1 5A055AA5
P 2150 6950
F 0 "Q?" V 2350 7025 50  0000 L CNN
F 1 "MMBT3904" V 2426 7029 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2350 6875 50  0001 L CIN
F 3 "" H 2150 6950 50  0001 L CNN
	1    2150 6950
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A055AAB
P 1850 7050
F 0 "#PWR?" H 1850 6800 50  0001 C CNN
F 1 "GND" H 1850 6900 50  0000 C CNN
F 2 "" H 1850 7050 50  0001 C CNN
F 3 "" H 1850 7050 50  0001 C CNN
	1    1850 7050
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5A055AB1
P 1900 6750
F 0 "R?" V 1980 6750 50  0000 C CNN
F 1 "1k" V 1900 6750 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1830 6750 50  0001 C CNN
F 3 "" H 1900 6750 50  0001 C CNN
	1    1900 6750
	0    -1   -1   0   
$EndComp
Text Label 1650 6750 2    50   ~ 0
RELAY_CTRL_B_SET
Wire Wire Line
	1850 7050 1950 7050
Wire Wire Line
	2050 6750 2150 6750
Wire Wire Line
	1750 6750 1650 6750
Wire Wire Line
	2200 7100 2900 7100
Wire Wire Line
	2900 7100 2900 7000
Text Label 5450 3200 2    50   ~ 0
RELAY_CTRL_A_RESET
Text Label 5450 3300 2    50   ~ 0
RELAY_CTRL_B_RESET
Wire Wire Line
	5450 3200 5650 3200
Wire Wire Line
	5450 3300 5650 3300
Text Notes 5650 700  0    50   ~ 0
With 1.2V in we only get about 60ma out max!\n\n
Wire Wire Line
	4550 1000 5800 1000
Wire Wire Line
	4550 1400 4550 1350
Wire Wire Line
	4550 1050 4550 1000
$EndSCHEMATC
