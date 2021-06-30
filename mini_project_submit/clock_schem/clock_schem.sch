EESchema Schematic File Version 4
EELAYER 30 0
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
L TRUNG:FSM F?
U 1 1 5EFA286A
P 5150 3750
F 0 "F?" H 5200 4115 50  0000 C CNN
F 1 "FSM" H 5200 4024 50  0000 C CNN
F 2 "" H 5150 4050 50  0001 C CNN
F 3 "" H 5150 4050 50  0001 C CNN
	1    5150 3750
	1    0    0    -1  
$EndComp
$Comp
L TRUNG:clock_divider c?
U 1 1 5EFA4666
P 3650 4650
F 0 "c?" H 3650 4915 50  0000 C CNN
F 1 "clock_divider" H 3650 4824 50  0000 C CNN
F 2 "" H 3650 4650 50  0001 C CNN
F 3 "" H 3650 4650 50  0001 C CNN
	1    3650 4650
	1    0    0    -1  
$EndComp
$Comp
L TRUNG:hour h?
U 1 1 5EFA5278
P 7700 4700
F 0 "h?" H 7650 4027 50  0000 C CNN
F 1 "hour" H 7650 3936 50  0000 C CNN
F 2 "" H 7700 4500 50  0001 C CNN
F 3 "" H 7700 4500 50  0001 C CNN
	1    7700 4700
	1    0    0    -1  
$EndComp
$Comp
L TRUNG:minute m?
U 1 1 5EFA6032
P 7600 3550
F 0 "m?" H 8144 3296 50  0000 L CNN
F 1 "minute" H 8144 3205 50  0000 L CNN
F 2 "" H 7700 3350 50  0001 C CNN
F 3 "" H 7700 3350 50  0001 C CNN
	1    7600 3550
	1    0    0    -1  
$EndComp
$Comp
L TRUNG:second s?
U 1 1 5EFA6C40
P 7700 2350
F 0 "s?" H 7600 2715 50  0000 C CNN
F 1 "second" H 7600 2624 50  0000 C CNN
F 2 "" H 7700 2350 50  0001 C CNN
F 3 "" H 7700 2350 50  0001 C CNN
	1    7700 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4650 4150 3750
Wire Wire Line
	4150 3750 4650 3750
Wire Wire Line
	5750 3650 5750 2350
Wire Wire Line
	5750 2350 7000 2350
Wire Wire Line
	5750 3750 5800 3750
Wire Wire Line
	5800 3750 5800 2450
Wire Wire Line
	5800 2450 7000 2450
Wire Wire Line
	5750 3850 5850 3850
Wire Wire Line
	5850 3750 7000 3750
Wire Wire Line
	5750 3950 5900 3950
Wire Wire Line
	5900 3950 5900 3850
Wire Wire Line
	5900 3850 7000 3850
Wire Wire Line
	5750 4050 6600 4050
Wire Wire Line
	6600 4050 6600 4900
Wire Wire Line
	6600 4900 7100 4900
Wire Wire Line
	5750 4150 6550 4150
Wire Wire Line
	6550 4150 6550 5000
Wire Wire Line
	6550 5000 7100 5000
Wire Wire Line
	7700 3050 7700 3200
Wire Wire Line
	2300 2700 3150 2700
Wire Wire Line
	4650 2700 4650 3650
Wire Wire Line
	4650 2700 4650 2250
Wire Wire Line
	4650 2250 6750 2250
Connection ~ 4650 2700
Wire Wire Line
	6750 2250 6750 3650
Wire Wire Line
	6750 3650 7000 3650
Connection ~ 6750 2250
Wire Wire Line
	6750 2250 7000 2250
Wire Wire Line
	6750 3650 6750 4800
Wire Wire Line
	6750 4800 7100 4800
Connection ~ 6750 3650
Wire Wire Line
	5850 3850 5850 3750
Wire Wire Line
	5750 4250 6250 4250
Wire Wire Line
	6250 4250 6250 2550
Wire Wire Line
	6250 2550 7000 2550
Wire Wire Line
	5750 4350 6800 4350
Wire Wire Line
	6800 4350 6800 3950
Wire Wire Line
	6800 3950 7000 3950
Wire Wire Line
	5750 4450 5750 5100
Wire Wire Line
	5750 5100 7100 5100
Text Label 2600 2700 0    50   ~ 0
clk50Mhz
Wire Wire Line
	2300 3850 4650 3850
Wire Wire Line
	2300 3950 4650 3950
Wire Wire Line
	2300 4050 4650 4050
Wire Wire Line
	4650 4150 2300 4150
Wire Wire Line
	4650 4250 2300 4250
Text Label 2400 3850 0    50   ~ 0
KEY0
Text Label 2400 3950 0    50   ~ 0
KEY1
Text Label 2400 4050 0    50   ~ 0
KEY2
Text Label 2400 4150 0    50   ~ 0
KEY3
Text Label 2400 4250 0    50   ~ 0
SW9
Wire Wire Line
	2300 5750 4650 5750
Wire Wire Line
	7100 5750 7100 5200
Wire Wire Line
	4650 4350 4650 5750
Connection ~ 4650 5750
Wire Wire Line
	4650 5750 6900 5750
Wire Wire Line
	7000 4050 7000 5750
Connection ~ 7000 5750
Wire Wire Line
	7000 5750 7100 5750
Wire Wire Line
	7000 2650 6900 2650
Wire Wire Line
	6900 2650 6900 5750
Connection ~ 6900 5750
Wire Wire Line
	6900 5750 7000 5750
Wire Wire Line
	3150 4650 3150 2700
Connection ~ 3150 2700
Wire Wire Line
	3150 2700 4650 2700
Wire Wire Line
	5050 4650 5050 5150
Text Label 5050 5050 0    50   ~ 0
HEX7
Wire Bus Line
	8200 2250 8750 2250
Wire Bus Line
	8100 3650 8800 3650
Wire Bus Line
	8200 4800 8800 4800
Text Label 8300 2250 0    50   ~ 0
HEX1,HEX0
Text Label 8350 3650 0    50   ~ 0
HEX3,HEX2
Text Label 8350 4800 0    50   ~ 0
HEX5,HEX4
Wire Wire Line
	7700 3200 8800 3200
Connection ~ 7700 3200
Wire Wire Line
	7700 3200 7700 3450
Wire Wire Line
	7700 4250 7700 4400
Wire Wire Line
	7700 4400 8800 4400
Connection ~ 7700 4400
Wire Wire Line
	7700 4400 7700 4600
Text Label 8350 3200 0    50   ~ 0
LEDR1
Text Label 8400 4400 0    50   ~ 0
LEDR2
Wire Wire Line
	4150 4650 4150 5150
Connection ~ 4150 4650
Text Label 4150 5000 0    50   ~ 0
LEDR0
Text Label 2400 5750 0    50   ~ 0
SW0
$EndSCHEMATC
