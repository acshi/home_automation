EESchema Schematic File Version 4
LIBS:smartrelay-cache
EELAYER 26 0
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
L opto:TSOP382xx U4
U 1 1 59AE1C61
P 7650 4650
F 0 "U4" H 7250 4950 50  0000 L CNN
F 1 "TSOP38338" H 7250 4350 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7600 4275 50  0001 C CNN
F 3 "" H 8300 4950 50  0000 C CNN
	1    7650 4650
	1    0    0    -1  
$EndComp
$Comp
L opto:LD271 D2
U 1 1 59AE2EE3
P 9450 5300
F 0 "D2" H 9470 5370 50  0000 L CNN
F 1 "IR1503" H 9410 5190 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9450 5475 50  0001 C CNN
F 3 "" H 9400 5300 50  0000 C CNN
	1    9450 5300
	0    -1   -1   0   
$EndComp
$Comp
L device:R R13
U 1 1 59AE2F4D
P 9450 4950
F 0 "R13" V 9530 4950 50  0000 C CNN
F 1 "3.9R" V 9450 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 9380 4950 50  0001 C CNN
F 3 "" H 9450 4950 50  0001 C CNN
	1    9450 4950
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR028
U 1 1 59AE3174
P 9450 6100
F 0 "#PWR028" H 9450 5850 50  0001 C CNN
F 1 "GND" H 9450 5950 50  0000 C CNN
F 2 "" H 9450 6100 50  0001 C CNN
F 3 "" H 9450 6100 50  0001 C CNN
	1    9450 6100
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR024
U 1 1 59AE32BD
P 8150 5400
F 0 "#PWR024" H 8150 5150 50  0001 C CNN
F 1 "GND" H 8150 5250 50  0000 C CNN
F 2 "" H 8150 5400 50  0001 C CNN
F 3 "" H 8150 5400 50  0001 C CNN
	1    8150 5400
	1    0    0    -1  
$EndComp
$Comp
L power1:+5V #PWR023
U 1 1 59AE32EC
P 8150 4450
F 0 "#PWR023" H 8150 4300 50  0001 C CNN
F 1 "+5V" H 8150 4590 50  0000 C CNN
F 2 "" H 8150 4450 50  0001 C CNN
F 3 "" H 8150 4450 50  0001 C CNN
	1    8150 4450
	0    1    1    0   
$EndComp
$Comp
L power1:+5V #PWR027
U 1 1 59AE3323
P 9450 4700
F 0 "#PWR027" H 9450 4550 50  0001 C CNN
F 1 "+5V" H 9450 4840 50  0000 C CNN
F 2 "" H 9450 4700 50  0001 C CNN
F 3 "" H 9450 4700 50  0001 C CNN
	1    9450 4700
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR07
U 1 1 59AE3708
P 2350 3950
F 0 "#PWR07" H 2350 3700 50  0001 C CNN
F 1 "GND" H 2350 3800 50  0000 C CNN
F 2 "" H 2350 3950 50  0001 C CNN
F 3 "" H 2350 3950 50  0001 C CNN
	1    2350 3950
	1    0    0    -1  
$EndComp
Text Label 8250 4650 0    50   ~ 0
IR_RECV
Text Label 3850 2850 0    50   ~ 0
IR_RECV
Text Label 9850 5800 0    50   ~ 0
IR_SEND
Text Label 3850 2950 0    50   ~ 0
IR_SEND
Text Label 3850 3150 0    50   ~ 0
RELAY_CTRL_B_SET
$Comp
L conn:Screw_Terminal_1x03 J1
U 1 1 59AF6154
P 5450 3350
F 0 "J1" H 5450 3700 50  0000 C TNN
F 1 "OSTYK42103030" V 5300 3350 50  0000 C TNN
F 2 "conn_barrier:CONN_BARRIER_STRIP_3CIRC_0.325in" H 5450 3025 50  0001 C CNN
F 3 "" H 5425 3450 50  0001 C CNN
	1    5450 3350
	1    0    0    -1  
$EndComp
Text Label 5750 3150 0    50   ~ 0
LiveIn
Text Label 5750 3350 0    50   ~ 0
LiveOutA
Text Label 3850 1550 0    50   ~ 0
MISO
Text Label 3850 1450 0    50   ~ 0
MOSI
Text Label 3850 2650 0    50   ~ 0
~RST
Text Label 3850 1650 0    50   ~ 0
SCK
$Comp
L device:Battery_Cell BT1
U 1 1 59AF79DA
P 4800 1250
F 0 "BT1" H 4900 1350 50  0000 L CNN
F 1 "Battery_Cell" H 4900 1250 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 4800 1310 50  0001 C CNN
F 3 "" V 4800 1310 50  0001 C CNN
	1    4800 1250
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR010
U 1 1 59AF7ABD
P 4800 1450
F 0 "#PWR010" H 4800 1200 50  0001 C CNN
F 1 "GND" H 4800 1300 50  0000 C CNN
F 2 "" H 4800 1450 50  0001 C CNN
F 3 "" H 4800 1450 50  0001 C CNN
	1    4800 1450
	1    0    0    -1  
$EndComp
$Comp
L dc-dc:MCP1640-CH U2
U 1 1 59B05EE7
P 6200 1100
F 0 "U2" H 5900 1525 50  0000 L CNN
F 1 "MCP16251T-I/CH" H 5900 1450 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6_Handsoldering" H 6200 600 50  0001 C CIN
F 3 "" H 5950 1550 50  0001 C CNN
	1    6200 1100
	1    0    0    -1  
$EndComp
Text Label 5300 1000 2    50   ~ 0
+1.2V
$Comp
L power1:GND #PWR016
U 1 1 59B05FE3
P 6200 1500
F 0 "#PWR016" H 6200 1250 50  0001 C CNN
F 1 "GND" H 6200 1350 50  0000 C CNN
F 2 "" H 6200 1500 50  0001 C CNN
F 3 "" H 6200 1500 50  0001 C CNN
	1    6200 1500
	1    0    0    -1  
$EndComp
$Comp
L power1:+5V #PWR022
U 1 1 59B06033
P 7650 1100
F 0 "#PWR022" H 7650 950 50  0001 C CNN
F 1 "+5V" H 7650 1240 50  0000 C CNN
F 2 "" H 7650 1100 50  0001 C CNN
F 3 "" H 7650 1100 50  0001 C CNN
	1    7650 1100
	0    1    1    0   
$EndComp
$Comp
L device:L L1
U 1 1 59B06085
P 6750 900
F 0 "L1" V 6700 900 50  0000 C CNN
F 1 "4.7uH" V 6825 900 50  0000 C CNN
F 2 "Inductor_THT:L_Radial_D9.5mm_P5.00mm_Fastron_07HVP" H 6750 900 50  0001 C CNN
F 3 "" H 6750 900 50  0001 C CNN
	1    6750 900 
	0    1    1    0   
$EndComp
Text Label 6900 900  0    50   ~ 0
+1.2V
$Comp
L device:R R8
U 1 1 59B0AA2A
P 6750 1300
F 0 "R8" V 6830 1300 50  0000 C CNN
F 1 "3.09M" V 6750 1300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6680 1300 50  0001 C CNN
F 3 "" H 6750 1300 50  0001 C CNN
	1    6750 1300
	1    0    0    -1  
$EndComp
$Comp
L device:R R9
U 1 1 59B0AA65
P 6750 1700
F 0 "R9" V 6830 1700 50  0000 C CNN
F 1 "1M" V 6750 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6680 1700 50  0001 C CNN
F 3 "" H 6750 1700 50  0001 C CNN
	1    6750 1700
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR018
U 1 1 59B0AD51
P 6750 1850
F 0 "#PWR018" H 6750 1600 50  0001 C CNN
F 1 "GND" H 6750 1700 50  0000 C CNN
F 2 "" H 6750 1850 50  0001 C CNN
F 3 "" H 6750 1850 50  0001 C CNN
	1    6750 1850
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR019
U 1 1 59B0ADDF
P 7000 1450
F 0 "#PWR019" H 7000 1200 50  0001 C CNN
F 1 "GND" H 7000 1300 50  0000 C CNN
F 2 "" H 7000 1450 50  0001 C CNN
F 3 "" H 7000 1450 50  0001 C CNN
	1    7000 1450
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR020
U 1 1 59B0B75A
P 7250 1450
F 0 "#PWR020" H 7250 1200 50  0001 C CNN
F 1 "GND" H 7250 1300 50  0000 C CNN
F 2 "" H 7250 1450 50  0001 C CNN
F 3 "" H 7250 1450 50  0001 C CNN
	1    7250 1450
	1    0    0    -1  
$EndComp
Text Label 3850 2150 0    50   ~ 0
NOISE
$Comp
L transistors:PN2222A Q9
U 1 1 59F2AE20
P 9650 3050
F 0 "Q9" H 9850 3125 50  0000 L CNN
F 1 "MMBT3904" H 9850 3050 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 9850 2975 50  0001 L CIN
F 3 "" H 9650 3050 50  0001 L CNN
	1    9650 3050
	1    0    0    -1  
$EndComp
$Comp
L device:R R12
U 1 1 59F2AFA6
P 9050 2600
F 0 "R12" V 9130 2600 50  0000 C CNN
F 1 "680k" V 9050 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8980 2600 50  0001 C CNN
F 3 "" H 9050 2600 50  0001 C CNN
	1    9050 2600
	1    0    0    -1  
$EndComp
$Comp
L device:R R14
U 1 1 59F2B03D
P 9750 2600
F 0 "R14" V 9830 2600 50  0000 C CNN
F 1 "4.7k" V 9750 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 9680 2600 50  0001 C CNN
F 3 "" H 9750 2600 50  0001 C CNN
	1    9750 2600
	1    0    0    -1  
$EndComp
$Comp
L device:C C9
U 1 1 59F2B1E4
P 8500 3000
F 0 "C9" H 8525 3100 50  0000 L CNN
F 1 "100nF" H 8525 2900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8538 2850 50  0001 C CNN
F 3 "" H 8500 3000 50  0001 C CNN
	1    8500 3000
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR025
U 1 1 59F2B2E6
P 8500 3150
F 0 "#PWR025" H 8500 2900 50  0001 C CNN
F 1 "GND" H 8500 3000 50  0000 C CNN
F 2 "" H 8500 3150 50  0001 C CNN
F 3 "" H 8500 3150 50  0001 C CNN
	1    8500 3150
	1    0    0    -1  
$EndComp
$Comp
L device:R R15
U 1 1 59F2B4E2
P 9750 3500
F 0 "R15" V 9830 3500 50  0000 C CNN
F 1 "1k" V 9750 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 9680 3500 50  0001 C CNN
F 3 "" H 9750 3500 50  0001 C CNN
	1    9750 3500
	1    0    0    -1  
$EndComp
$Comp
L device:R R16
U 1 1 59F2BD59
P 10450 3250
F 0 "R16" V 10530 3250 50  0000 C CNN
F 1 "100k" V 10450 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10380 3250 50  0001 C CNN
F 3 "" H 10450 3250 50  0001 C CNN
	1    10450 3250
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR029
U 1 1 59F2BF06
P 10450 3650
F 0 "#PWR029" H 10450 3400 50  0001 C CNN
F 1 "GND" H 10450 3500 50  0000 C CNN
F 2 "" H 10450 3650 50  0001 C CNN
F 3 "" H 10450 3650 50  0001 C CNN
	1    10450 3650
	1    0    0    -1  
$EndComp
$Comp
L power1:+5V #PWR026
U 1 1 59F2BF54
P 9050 2450
F 0 "#PWR026" H 9050 2300 50  0001 C CNN
F 1 "+5V" H 9050 2590 50  0000 C CNN
F 2 "" H 9050 2450 50  0001 C CNN
F 3 "" H 9050 2450 50  0001 C CNN
	1    9050 2450
	1    0    0    -1  
$EndComp
Text Label 10600 2800 0    50   ~ 0
NOISE
Text Label 3850 2050 0    50   ~ 0
+1.2V
Wire Wire Line
	9450 5100 9450 5200
Wire Wire Line
	9450 5500 9450 5600
Wire Wire Line
	9450 6000 9450 6100
Wire Wire Line
	8150 4450 8050 4450
Wire Wire Line
	9450 4700 9450 4800
Wire Wire Line
	8050 4650 8250 4650
Wire Wire Line
	5650 3150 5750 3150
Wire Wire Line
	4800 1000 4800 1050
Wire Wire Line
	6600 1100 6750 1100
Wire Wire Line
	4800 1350 4800 1400
Connection ~ 4800 1000
Connection ~ 4800 1400
Wire Wire Line
	6600 1200 6600 1500
Wire Wire Line
	6750 1450 6750 1500
Wire Wire Line
	6600 1500 6750 1500
Connection ~ 6750 1500
Connection ~ 7000 1100
Wire Wire Line
	6750 1150 6750 1100
Connection ~ 6750 1100
Connection ~ 7250 1100
Wire Wire Line
	5350 1000 5350 1200
Connection ~ 5350 1000
Wire Wire Line
	5350 1200 5800 1200
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
	9750 2750 9750 2800
Wire Wire Line
	10050 3350 9750 3350
Wire Wire Line
	9750 3350 9750 3250
Connection ~ 9750 2800
Wire Wire Line
	10450 3100 10450 2800
Wire Wire Line
	10450 3650 10450 3400
Wire Wire Line
	10450 2800 10600 2800
Text Label 3850 3250 0    50   ~ 0
RELAY_CTRL_B_RESET
Text Label 5750 3550 0    50   ~ 0
LiveOutB
$Comp
L device:CP1 C8
U 1 1 5A052D92
P 7500 1700
F 0 "C8" H 7525 1800 50  0000 L CNN
F 1 "2200uF" H 7525 1600 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 7538 1550 50  0001 C CNN
F 3 "" H 7500 1700 50  0001 C CNN
F 4 "10V" H 7598 1700 60  0000 L CNN "Voltage"
	1    7500 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1150 7500 1100
Connection ~ 7500 1100
$Comp
L power1:GND #PWR021
U 1 1 5A05366D
P 7500 2300
F 0 "#PWR021" H 7500 2050 50  0001 C CNN
F 1 "GND" H 7500 2150 50  0000 C CNN
F 2 "" H 7500 2300 50  0001 C CNN
F 3 "" H 7500 2300 50  0001 C CNN
	1    7500 2300
	1    0    0    -1  
$EndComp
$Comp
L LatchingDualCoilRelay:G5RL-K1A-E RL1
U 1 1 5A053125
P 2900 5300
F 0 "RL1" H 3450 5650 50  0000 L CNN
F 1 "G5RL-K1A-E" H 3450 5550 50  0000 L CNN
F 2 "LatchingRelay:LatchingRelayG5RL-K1A-E" H 3450 5450 50  0001 L CNN
F 3 "" H 3100 5900 50  0000 C CNN
	1    2900 5300
	1    0    0    -1  
$EndComp
Text Label 3300 5400 3    50   ~ 0
LiveIn
Text Label 3300 4800 1    50   ~ 0
LiveOutA
$Comp
L power1:GND #PWR02
U 1 1 5A054829
P 1850 4750
F 0 "#PWR02" H 1850 4500 50  0001 C CNN
F 1 "GND" H 1850 4600 50  0000 C CNN
F 2 "" H 1850 4750 50  0001 C CNN
F 3 "" H 1850 4750 50  0001 C CNN
	1    1850 4750
	0    1    1    0   
$EndComp
Text Label 1650 4450 2    50   ~ 0
RELAY_CTRL_A_RESET
Wire Wire Line
	1850 4750 1950 4750
Wire Wire Line
	2350 4750 2900 4750
Wire Wire Line
	2900 4750 2900 4800
$Comp
L power1:GND #PWR03
U 1 1 5A054E07
P 1850 5450
F 0 "#PWR03" H 1850 5200 50  0001 C CNN
F 1 "GND" H 1850 5300 50  0000 C CNN
F 2 "" H 1850 5450 50  0001 C CNN
F 3 "" H 1850 5450 50  0001 C CNN
	1    1850 5450
	0    1    1    0   
$EndComp
Text Label 1650 5150 2    50   ~ 0
RELAY_CTRL_A_SET
Wire Wire Line
	1850 5450 1950 5450
$Comp
L LatchingDualCoilRelay:G5RL-K1A-E RL2
U 1 1 5A055A7F
P 2900 6900
F 0 "RL2" H 3450 7250 50  0000 L CNN
F 1 "G5RL-K1A-E" H 3450 7150 50  0000 L CNN
F 2 "LatchingRelay:LatchingRelayG5RL-K1A-E" H 3450 7050 50  0001 L CNN
F 3 "" H 3100 7500 50  0000 C CNN
	1    2900 6900
	1    0    0    -1  
$EndComp
Text Label 3300 7000 3    50   ~ 0
LiveIn
Text Label 3300 6400 1    50   ~ 0
LiveOutB
$Comp
L power1:GND #PWR04
U 1 1 5A055A8D
P 1850 6350
F 0 "#PWR04" H 1850 6100 50  0001 C CNN
F 1 "GND" H 1850 6200 50  0000 C CNN
F 2 "" H 1850 6350 50  0001 C CNN
F 3 "" H 1850 6350 50  0001 C CNN
	1    1850 6350
	0    1    1    0   
$EndComp
Text Label 1650 6050 2    50   ~ 0
RELAY_CTRL_B_RESET
Wire Wire Line
	1850 6350 1950 6350
Wire Wire Line
	2350 6350 2900 6350
Wire Wire Line
	2900 6350 2900 6400
$Comp
L power1:GND #PWR05
U 1 1 5A055AAB
P 1850 7050
F 0 "#PWR05" H 1850 6800 50  0001 C CNN
F 1 "GND" H 1850 6900 50  0000 C CNN
F 2 "" H 1850 7050 50  0001 C CNN
F 3 "" H 1850 7050 50  0001 C CNN
	1    1850 7050
	0    1    1    0   
$EndComp
Text Label 1650 6750 2    50   ~ 0
RELAY_CTRL_B_SET
Wire Wire Line
	1850 7050 1950 7050
Text Label 3850 1750 0    50   ~ 0
RELAY_CTRL_A_SET
Text Label 3850 1850 0    50   ~ 0
RELAY_CTRL_A_RESET
Text Notes 5650 700  0    50   ~ 0
With 1.2V in we only get about 60mA out max!\n\n
Wire Wire Line
	4550 1000 4800 1000
Wire Wire Line
	5650 3350 5750 3350
Wire Wire Line
	5650 3550 5750 3550
Wire Wire Line
	2900 5400 2900 5450
Wire Wire Line
	2900 5450 2350 5450
Wire Wire Line
	2900 7000 2900 7050
Wire Wire Line
	2900 7050 2350 7050
$Comp
L device:C C5
U 1 1 5A7697B9
P 6700 5400
F 0 "C5" H 6725 5500 50  0000 L CNN
F 1 "100nF" H 6725 5300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6738 5250 50  0001 C CNN
F 3 "" H 6700 5400 50  0001 C CNN
	1    6700 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 5150 6700 5150
Wire Wire Line
	6700 5150 6700 5250
$Comp
L power1:GND #PWR017
U 1 1 5A76993F
P 6700 5600
F 0 "#PWR017" H 6700 5350 50  0001 C CNN
F 1 "GND" H 6700 5450 50  0000 C CNN
F 2 "" H 6700 5600 50  0001 C CNN
F 3 "" H 6700 5600 50  0001 C CNN
	1    6700 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 5600 6700 5550
$Comp
L device:C C4
U 1 1 5A769A28
P 5700 5500
F 0 "C4" H 5725 5600 50  0000 L CNN
F 1 "100nF" H 5725 5400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5738 5350 50  0001 C CNN
F 3 "" H 5700 5500 50  0001 C CNN
	1    5700 5500
	1    0    0    -1  
$EndComp
$Comp
L device:R R7
U 1 1 5A769ACA
P 5450 5250
F 0 "R7" V 5530 5250 50  0000 C CNN
F 1 "470k" V 5450 5250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5380 5250 50  0001 C CNN
F 3 "" H 5450 5250 50  0001 C CNN
	1    5450 5250
	0    1    1    0   
$EndComp
$Comp
L device:R R3
U 1 1 5A769BA7
P 5200 5500
F 0 "R3" V 5280 5500 50  0000 C CNN
F 1 "22M" V 5200 5500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5130 5500 50  0001 C CNN
F 3 "" H 5200 5500 50  0001 C CNN
	1    5200 5500
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR012
U 1 1 5A769D3D
P 5700 5700
F 0 "#PWR012" H 5700 5450 50  0001 C CNN
F 1 "GND" H 5700 5550 50  0000 C CNN
F 2 "" H 5700 5700 50  0001 C CNN
F 3 "" H 5700 5700 50  0001 C CNN
	1    5700 5700
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR011
U 1 1 5A769DA5
P 5200 6600
F 0 "#PWR011" H 5200 6350 50  0001 C CNN
F 1 "GND" H 5200 6450 50  0000 C CNN
F 2 "" H 5200 6600 50  0001 C CNN
F 3 "" H 5200 6600 50  0001 C CNN
	1    5200 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5700 5700 5650
Wire Wire Line
	5700 5350 5700 5250
Wire Wire Line
	5600 5250 5700 5250
Wire Wire Line
	5200 5050 5200 5250
Wire Wire Line
	5200 5250 5300 5250
Connection ~ 5700 5250
Wire Wire Line
	5100 5050 5200 5050
Connection ~ 5200 5250
$Comp
L device:C C3
U 1 1 5A76A19D
P 4950 5050
F 0 "C3" H 4975 5150 50  0000 L CNN
F 1 "0.15nF" H 4975 4950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4988 4900 50  0001 C CNN
F 3 "" H 4950 5050 50  0001 C CNN
	1    4950 5050
	0    1    1    0   
$EndComp
Connection ~ 5200 5050
$Comp
L device:D_Photo D1
U 1 1 5A76A530
P 4350 5300
F 0 "D1" H 4370 5370 50  0000 L CNN
F 1 "D_Photo" H 4310 5190 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4300 5300 50  0001 C CNN
F 3 "" H 4300 5300 50  0001 C CNN
	1    4350 5300
	0    1    1    0   
$EndComp
$Comp
L power1:GND #PWR08
U 1 1 5A76A5AD
P 4350 5500
F 0 "#PWR08" H 4350 5250 50  0001 C CNN
F 1 "GND" H 4350 5350 50  0000 C CNN
F 2 "" H 4350 5500 50  0001 C CNN
F 3 "" H 4350 5500 50  0001 C CNN
	1    4350 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5400 4350 5450
$Comp
L device:R R2
U 1 1 5A76A80E
P 4600 5250
F 0 "R2" V 4680 5250 50  0000 C CNN
F 1 "1M" V 4600 5250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4530 5250 50  0001 C CNN
F 3 "" H 4600 5250 50  0001 C CNN
	1    4600 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 5450 4600 5400
Wire Wire Line
	4350 5050 4600 5050
Connection ~ 4600 5050
Wire Wire Line
	4350 5100 4350 5050
Wire Wire Line
	4600 5100 4600 5050
$Comp
L power1:GND #PWR015
U 1 1 5A76B0D9
P 6150 5500
F 0 "#PWR015" H 6150 5250 50  0001 C CNN
F 1 "GND" H 6150 5350 50  0000 C CNN
F 2 "" H 6150 5500 50  0001 C CNN
F 3 "" H 6150 5500 50  0001 C CNN
	1    6150 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 4850 6150 4750
Text Label 6150 4750 0    50   ~ 0
+5V
Wire Wire Line
	6150 5500 6150 5450
Wire Wire Line
	4600 5450 4350 5450
Connection ~ 4350 5450
Connection ~ 6700 5150
Text Label 6800 5150 0    50   ~ 0
WAKEUP
$Comp
L device:Q_NMOS_GSD Q6
U 1 1 5A78E548
P 8250 5150
F 0 "Q6" H 8450 5200 50  0000 L CNN
F 1 "2N7002WT1G" H 8450 5100 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-323_SC-70_Handsoldering" H 8450 5250 50  0001 C CNN
F 3 "" H 8250 5150 50  0001 C CNN
	1    8250 5150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8150 5350 8150 5400
Wire Wire Line
	8050 4850 8150 4850
Wire Wire Line
	8150 4850 8150 4950
Wire Wire Line
	8450 5150 8550 5150
Text Label 8550 5150 0    50   ~ 0
RECV_ENABLE
Wire Wire Line
	4800 1000 5350 1000
Wire Wire Line
	4800 1400 4800 1450
Wire Wire Line
	6750 1500 6750 1550
Wire Wire Line
	7000 1100 7250 1100
Wire Wire Line
	6750 1100 7000 1100
Wire Wire Line
	7250 1100 7500 1100
Wire Wire Line
	5350 1000 5800 1000
Wire Wire Line
	9750 2800 9750 2850
Wire Wire Line
	7500 1100 7650 1100
Wire Wire Line
	5700 5250 5950 5250
Wire Wire Line
	5200 5250 5200 5350
Wire Wire Line
	5200 5050 5950 5050
Wire Wire Line
	4600 5050 4800 5050
Wire Wire Line
	4350 5450 4350 5500
Wire Wire Line
	6700 5150 6800 5150
Text Notes 2650 4400 0    50   ~ 0
150mA at 5V (min 3.5V?)\nfor 15ms for relays to switch\nso 33R coil resistance
Text Notes 7850 1800 0    50   ~ 0
max 110uA leakage,\n22uA for low leakage nichicon
Text Notes 7350 4250 0    50   ~ 0
350uA quiescent
Text Notes 5950 4550 0    50   ~ 0
1.6uA quiescent\n4mV hysteresis
Text Notes 5100 4750 0    50   ~ 0
5mV max offset voltage\n1mV typical
Text Notes 2600 3800 0    50   ~ 0
less than 1uA in power down mode
$Comp
L device:C_Small C6
U 1 1 5DA6FD76
P 7000 1300
F 0 "C6" H 7000 1400 50  0000 L CNN
F 1 "10uF" H 7000 1200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7000 1300 50  0001 C CNN
F 3 "~" H 7000 1300 50  0001 C CNN
	1    7000 1300
	1    0    0    -1  
$EndComp
Text Notes 7750 900  0    50   ~ 0
1mA 5V draw will maybe take 8mA 1.2V draw,\nand a 2000mAh battery then last 10 days\n100uA would be 100 days\nand 25uA would be a year
$Comp
L device:C_Small C7
U 1 1 5DA709A6
P 7250 1300
F 0 "C7" H 7250 1400 50  0000 L CNN
F 1 "10uF" H 7250 1200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7250 1300 50  0001 C CNN
F 3 "~" H 7250 1300 50  0001 C CNN
	1    7250 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1450 7000 1400
Wire Wire Line
	7000 1100 7000 1200
Wire Wire Line
	7250 1100 7250 1200
Wire Wire Line
	7250 1400 7250 1450
$Comp
L device:C_Small C2
U 1 1 5DA824D9
P 4550 1200
F 0 "C2" H 4600 1300 50  0000 L CNN
F 1 "4.7uF" H 4600 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 1200 50  0001 C CNN
F 3 "~" H 4550 1200 50  0001 C CNN
	1    4550 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1300 4550 1400
Wire Wire Line
	4550 1000 4550 1100
$Comp
L device:C_Small C11
U 1 1 5DA8B96E
P 10300 2800
F 0 "C11" H 10350 2900 50  0000 L CNN
F 1 "10uF" H 10350 2700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10300 2800 50  0001 C CNN
F 3 "~" H 10300 2800 50  0001 C CNN
	1    10300 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9750 2800 10200 2800
Wire Wire Line
	10400 2800 10450 2800
Connection ~ 10450 2800
Wire Wire Line
	9750 3650 10050 3650
$Comp
L device:C_Small C10
U 1 1 5DA946DE
P 10050 3500
F 0 "C10" H 10100 3600 50  0000 L CNN
F 1 "10uF" H 10100 3400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10050 3500 50  0001 C CNN
F 3 "~" H 10050 3500 50  0001 C CNN
	1    10050 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 3400 10050 3350
Wire Wire Line
	10050 3650 10050 3600
Connection ~ 10050 3650
Wire Wire Line
	10050 3650 10450 3650
$Comp
L device:R R4
U 1 1 5DA9D81D
P 5200 5800
F 0 "R4" V 5280 5800 50  0000 C CNN
F 1 "22M" V 5200 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5130 5800 50  0001 C CNN
F 3 "" H 5200 5800 50  0001 C CNN
	1    5200 5800
	1    0    0    -1  
$EndComp
$Comp
L device:R R5
U 1 1 5DA9D895
P 5200 6100
F 0 "R5" V 5280 6100 50  0000 C CNN
F 1 "22M" V 5200 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5130 6100 50  0001 C CNN
F 3 "" H 5200 6100 50  0001 C CNN
	1    5200 6100
	1    0    0    -1  
$EndComp
$Comp
L device:R R6
U 1 1 5DAAEC8F
P 5200 6400
F 0 "R6" V 5280 6400 50  0000 C CNN
F 1 "22M" V 5200 6400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5130 6400 50  0001 C CNN
F 3 "" H 5200 6400 50  0001 C CNN
	1    5200 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 6600 5200 6550
Text Notes 6350 5950 0    50   ~ 0
AVR internal pullup is 20 to 50k
Text Notes 4950 1750 0    50   ~ 0
Quiescent current, 4uA output
Text Notes 9450 2300 0    50   ~ 0
Noise generation circuit
$Comp
L device:R R10
U 1 1 5DABEE9D
P 7500 1300
F 0 "R10" V 7580 1300 50  0000 C CNN
F 1 "47R" V 7500 1300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7430 1300 50  0001 C CNN
F 3 "" H 7500 1300 50  0001 C CNN
	1    7500 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1450 7500 1500
Wire Wire Line
	7500 1500 7750 1500
Connection ~ 7500 1500
Wire Wire Line
	7500 1500 7500 1550
Text Label 7750 1500 0    50   ~ 0
+5V_RELAY
Wire Wire Line
	2600 5100 2500 5100
Text Label 2500 5100 2    50   ~ 0
+5V_RELAY
Text Label 2500 6700 2    50   ~ 0
+5V_RELAY
Wire Wire Line
	2500 6700 2600 6700
$Comp
L device:Q_NMOS_GSD Q5
U 1 1 5DADB9AB
P 7600 2100
F 0 "Q5" H 7800 2150 50  0000 L CNN
F 1 "2N7002WT1G" H 7800 2050 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-323_SC-70_Handsoldering" H 7800 2200 50  0001 C CNN
F 3 "" H 7600 2100 50  0001 C CNN
	1    7600 2100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7500 1900 7500 1850
Text Notes 7850 2000 0    50   ~ 0
We'll have to take around 300ms\nto charge before we can drive the relay
Wire Wire Line
	7800 2100 7900 2100
Text Label 7900 2100 0    50   ~ 0
CAP_ENABLE
$Comp
L atmel:ATMEGA328PB-AU U1
U 1 1 5DB11049
P 2450 2350
F 0 "U1" H 3450 3800 50  0000 C CNN
F 1 "ATMEGA328PB-AU" H 2900 3800 50  0000 C CNN
F 2 "digikey-footprints:TQFP-32_7x7mm" H 2400 950 50  0001 L CIN
F 3 "http://www.atmel.com/images/atmel-42397-8-bit-avr-microcontroller-atmega328pb_datasheet.pdf" H 2150 2400 50  0001 C CNN
	1    2450 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3950 2350 3900
Wire Wire Line
	2350 3900 2250 3900
Wire Wire Line
	2250 3900 2250 3850
Connection ~ 2350 3900
Wire Wire Line
	2350 3900 2350 3850
$Comp
L power1:+5V #PWR06
U 1 1 5DB20493
P 2150 700
F 0 "#PWR06" H 2150 550 50  0001 C CNN
F 1 "+5V" H 2150 840 50  0000 C CNN
F 2 "" H 2150 700 50  0001 C CNN
F 3 "" H 2150 700 50  0001 C CNN
	1    2150 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 700  2150 750 
Wire Wire Line
	2350 750  2150 750 
Connection ~ 2150 750 
Wire Wire Line
	2150 750  2150 850 
Wire Wire Line
	2350 850  2350 750 
$Comp
L device:C C1
U 1 1 5DB30D9E
P 1900 750
F 0 "C1" V 1950 550 50  0000 L CNN
F 1 "100nF" V 1750 550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1938 600 50  0001 C CNN
F 3 "" H 1900 750 50  0001 C CNN
	1    1900 750 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5DB311EF
P 1650 750
F 0 "#PWR01" H 1650 500 50  0001 C CNN
F 1 "GND" V 1655 622 50  0000 R CNN
F 2 "" H 1650 750 50  0001 C CNN
F 3 "" H 1650 750 50  0001 C CNN
	1    1650 750 
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 750  1750 750 
Wire Wire Line
	2050 750  2150 750 
Text Label 3850 3050 0    50   ~ 0
WAKEUP
Text Label 3850 2250 0    50   ~ 0
RECV_ENABLE
Text Label 3850 2350 0    50   ~ 0
CAP_ENABLE
Wire Wire Line
	3750 1450 3850 1450
Wire Wire Line
	3750 1550 3850 1550
Wire Wire Line
	3750 1650 3850 1650
Wire Wire Line
	3750 2050 3850 2050
Wire Wire Line
	3750 2150 3850 2150
Wire Wire Line
	3850 2850 3750 2850
Wire Wire Line
	3750 2950 3850 2950
Wire Wire Line
	3750 3050 3850 3050
Wire Wire Line
	3750 3150 3850 3150
Wire Wire Line
	3750 3250 3850 3250
Wire Wire Line
	3750 1750 3850 1750
Wire Wire Line
	3750 1850 3850 1850
$Comp
L Connector:AVR-ISP-6 J2
U 1 1 5DBBE10B
P 7000 3350
F 0 "J2" H 6720 3446 50  0000 R CNN
F 1 "AVR-ISP-6" H 6720 3355 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 6750 3400 50  0001 C CNN
F 3 " ~" H 5725 2800 50  0001 C CNN
	1    7000 3350
	1    0    0    -1  
$EndComp
Text Label 7500 3350 0    50   ~ 0
SCK
Text Label 7500 3150 0    50   ~ 0
MISO
Text Label 7500 3250 0    50   ~ 0
MOSI
Text Label 7500 3450 0    50   ~ 0
~RST
Wire Wire Line
	7500 3250 7400 3250
Wire Wire Line
	7500 3150 7400 3150
$Comp
L power:GND #PWR014
U 1 1 5DBD921A
P 6900 3800
F 0 "#PWR014" H 6900 3550 50  0001 C CNN
F 1 "GND" H 6905 3627 50  0000 C CNN
F 2 "" H 6900 3800 50  0001 C CNN
F 3 "" H 6900 3800 50  0001 C CNN
	1    6900 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 3800 6900 3750
$Comp
L power1:+5V #PWR013
U 1 1 5DBDECBE
P 6900 2800
F 0 "#PWR013" H 6900 2650 50  0001 C CNN
F 1 "+5V" H 6900 2940 50  0000 C CNN
F 2 "" H 6900 2800 50  0001 C CNN
F 3 "" H 6900 2800 50  0001 C CNN
	1    6900 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 2800 6900 2850
Wire Wire Line
	7400 3450 7500 3450
Wire Wire Line
	7400 3350 7500 3350
$Comp
L device:R R1
U 1 1 5DC23000
P 4150 2650
F 0 "R1" V 4230 2650 50  0000 C CNN
F 1 "10k" V 4150 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4080 2650 50  0001 C CNN
F 3 "" H 4150 2650 50  0001 C CNN
	1    4150 2650
	0    1    1    0   
$EndComp
$Comp
L power1:+5V #PWR09
U 1 1 5DC230C4
P 4400 2650
F 0 "#PWR09" H 4400 2500 50  0001 C CNN
F 1 "+5V" H 4400 2790 50  0000 C CNN
F 2 "" H 4400 2650 50  0001 C CNN
F 3 "" H 4400 2650 50  0001 C CNN
	1    4400 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 2650 4300 2650
Wire Wire Line
	3750 2650 4000 2650
$Comp
L device:Q_NMOS_GSD Q1
U 1 1 5DC31013
P 2150 4650
F 0 "Q1" V 2100 4800 50  0000 L CNN
F 1 "2N7002WT1G" V 2100 4050 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-323_SC-70_Handsoldering" H 2350 4750 50  0001 C CNN
F 3 "" H 2150 4650 50  0001 C CNN
	1    2150 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 4450 2150 4450
$Comp
L device:Q_NMOS_GSD Q2
U 1 1 5DC6F8C7
P 2150 5350
F 0 "Q2" V 2100 5500 50  0000 L CNN
F 1 "2N7002WT1G" V 2100 4750 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-323_SC-70_Handsoldering" H 2350 5450 50  0001 C CNN
F 3 "" H 2150 5350 50  0001 C CNN
	1    2150 5350
	0    1    1    0   
$EndComp
$Comp
L device:Q_NMOS_GSD Q3
U 1 1 5DC6F943
P 2150 6250
F 0 "Q3" V 2100 6400 50  0000 L CNN
F 1 "2N7002WT1G" V 2100 5650 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-323_SC-70_Handsoldering" H 2350 6350 50  0001 C CNN
F 3 "" H 2150 6250 50  0001 C CNN
	1    2150 6250
	0    1    1    0   
$EndComp
$Comp
L device:Q_NMOS_GSD Q4
U 1 1 5DC6F9C7
P 2150 6950
F 0 "Q4" V 2100 7100 50  0000 L CNN
F 1 "2N7002WT1G" V 2100 6350 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-323_SC-70_Handsoldering" H 2350 7050 50  0001 C CNN
F 3 "" H 2150 6950 50  0001 C CNN
	1    2150 6950
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 6750 2150 6750
Wire Wire Line
	1650 6050 2150 6050
Wire Wire Line
	1650 5150 2150 5150
Text Notes 7650 2300 0    50   ~ 0
max 1.6R rdsOn
Text Notes 1850 5650 0    50   ~ 0
max 1.6R rdsOn
$Comp
L MAX918:MAX918ESA U3
U 1 1 5DC83FD9
P 6250 5150
F 0 "U3" H 6300 4950 50  0000 L CNN
F 1 "MAX918ESA" H 6300 5350 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6250 4750 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX917-MAX920.pdf" H 6250 5150 50  0001 C CNN
	1    6250 5150
	1    0    0    -1  
$EndComp
$Comp
L transistors:PN2222A Q7
U 1 1 59F2AD07
P 9150 3050
F 0 "Q7" H 9350 3125 50  0000 L CNN
F 1 "MMBT3904" H 8800 2850 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 9350 2975 50  0001 L CIN
F 3 "" H 9150 3050 50  0001 L CNN
	1    9150 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	3850 2250 3750 2250
Wire Wire Line
	3850 2350 3750 2350
Text Notes 9600 4900 0    50   ~ 0
For 0.5A bursts w/ 2.2V forward voltage
$Comp
L device:Q_NMOS_GSD Q8
U 1 1 5DB51E1C
P 9550 5800
F 0 "Q8" H 9750 5850 50  0000 L CNN
F 1 "2N7002WT1G" H 9750 5750 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-323_SC-70_Handsoldering" H 9750 5900 50  0001 C CNN
F 3 "" H 9550 5800 50  0001 C CNN
	1    9550 5800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9850 5800 9750 5800
Text Notes 9800 5950 0    50   ~ 0
1.4R rdsOn at 0.5A
Text Notes 4050 900  0    50   ~ 0
Ceramic leakage current probably 0.5uA max
$EndSCHEMATC
