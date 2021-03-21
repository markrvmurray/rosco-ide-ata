EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ROSCO_M68K IDE/ATA EXPANSION"
Date "2021-03-21"
Rev "1.0"
Comp "Grondar the Adventurer (NSC)"
Comment1 "See https://github.com/rosco-m68k/hardware-projects/blob/master/LICENCE.hardware.txt"
Comment2 "Open Source Hardware licenced under CERN Open Hardware Licence"
Comment3 ""
Comment4 "Copyright ©2021 Mark Murray"
$EndDescr
Text GLabel 1750 1000 0    50   Output ~ 0
A1
Text GLabel 1750 1100 0    50   Output ~ 0
A2
Text GLabel 1750 1200 0    50   Output ~ 0
A3
Text GLabel 1750 1300 0    50   Output ~ 0
A4
Text GLabel 1750 1400 0    50   Output ~ 0
A5
Text GLabel 1750 1500 0    50   Output ~ 0
A6
Text GLabel 1750 1600 0    50   Output ~ 0
A7
Text GLabel 1750 1700 0    50   Output ~ 0
A8
Text GLabel 1750 1800 0    50   Output ~ 0
A9
Text GLabel 1750 1900 0    50   Output ~ 0
A10
Text GLabel 1750 2000 0    50   Output ~ 0
A11
Text GLabel 1750 2100 0    50   Output ~ 0
A12
Text GLabel 1750 2200 0    50   Output ~ 0
A13
Text GLabel 1750 2300 0    50   Output ~ 0
A14
Text GLabel 1750 2500 0    50   Output ~ 0
A16
Text GLabel 1750 2600 0    50   Output ~ 0
A17
Text GLabel 2250 3500 2    50   BiDi ~ 0
D8
Text GLabel 2250 3400 2    50   BiDi ~ 0
D9
Text GLabel 2250 3300 2    50   BiDi ~ 0
D10
Text GLabel 2250 3200 2    50   BiDi ~ 0
D11
Text GLabel 2250 3100 2    50   BiDi ~ 0
D12
Text GLabel 2250 3000 2    50   BiDi ~ 0
D13
Text GLabel 2250 2900 2    50   BiDi ~ 0
D14
Text GLabel 2250 2800 2    50   BiDi ~ 0
D15
Text GLabel 2550 2600 2    50   Output ~ 0
~UDS~
Text GLabel 1450 3900 0    50   Output ~ 0
R~W~
$Comp
L power:PWR_FLAG #GND01
U 1 1 5EB06E7A
P 2500 1200
F 0 "#GND01" H 2500 1275 50  0001 C CNN
F 1 "PWR_FLAG" H 2500 1373 50  0001 C CNN
F 2 "" H 2500 1200 50  0001 C CNN
F 3 "~" H 2500 1200 50  0001 C CNN
	1    2500 1200
	1    0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #VCC01
U 1 1 5EB06E82
P 2500 950
F 0 "#VCC01" H 2500 1025 50  0001 C CNN
F 1 "PWR_FLAG" H 2500 1123 50  0001 C CNN
F 2 "" H 2500 950 50  0001 C CNN
F 3 "~" H 2500 950 50  0001 C CNN
	1    2500 950 
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2500 950  2500 1000
NoConn ~ 2250 1400
NoConn ~ 2250 1500
NoConn ~ 2250 1600
NoConn ~ 1750 3500
NoConn ~ 1750 3600
NoConn ~ 1750 3700
Text GLabel 2250 1700 2    50   Output ~ 0
~IOSEL~
Text GLabel 2250 1900 2    50   Output ~ 0
FC0
Text GLabel 2250 2000 2    50   Output ~ 0
FC1
Text GLabel 2250 2100 2    50   Output ~ 0
FC2
NoConn ~ 1750 3200
NoConn ~ 1750 3100
NoConn ~ 1750 3000
NoConn ~ 1750 2900
NoConn ~ 1750 2800
Text GLabel 2250 1300 2    50   Input ~ 0
~VPA~
Text GLabel 2250 2700 2    50   Output ~ 0
~RESET~
NoConn ~ 2250 1800
Text GLabel 1750 3800 0    50   Input ~ 0
~DTACK~
Text GLabel 2500 2200 2    50   3State ~ 0
~IPL0~
Connection ~ 2500 1000
Connection ~ 2500 1200
NoConn ~ 1750 2700
Text GLabel 1750 2400 0    50   Output ~ 0
A15
Text GLabel 2250 3600 2    50   BiDi ~ 0
D7
Text GLabel 2250 3700 2    50   BiDi ~ 0
D6
Text GLabel 2250 3800 2    50   BiDi ~ 0
D5
Text GLabel 2250 3900 2    50   BiDi ~ 0
D4
Text GLabel 2250 4000 2    50   BiDi ~ 0
D3
Text GLabel 2250 4100 2    50   BiDi ~ 0
D2
Text GLabel 1750 4100 0    50   BiDi ~ 0
D1
Text GLabel 1750 4000 0    50   BiDi ~ 0
D0
Text GLabel 2250 2500 2    50   Output ~ 0
~LDS~
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J2
U 1 1 6023D392
P 9350 4500
F 0 "J2" H 9350 5500 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 9450 3400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20_Pitch2.54mm" H 9350 4500 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2012759.pdf" H 9350 4500 50  0001 C CNN
F 4 "uk.farnell.com 1106737" H 9350 4500 50  0001 C CNN "Vendor"
	1    9350 4500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC245 U4
U 1 1 602433AC
P 1950 6050
F 0 "U4" H 2200 6700 50  0000 C CNN
F 1 "74HCT245" H 1750 6700 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm_Socket_LongPads" H 1950 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 1950 6050 50  0001 C CNN
F 4 "uk.farnell.com 3119519" H 1950 6050 50  0001 C CNN "Vendor"
	1    1950 6050
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74HC245 U5
U 1 1 60246C41
P 3750 6050
F 0 "U5" H 4000 6700 50  0000 C CNN
F 1 "74HCT245" H 3550 6700 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm_Socket_LongPads" H 3750 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 3750 6050 50  0001 C CNN
F 4 "uk.farnell.com 3119519" H 3750 6050 50  0001 C CNN "Vendor"
	1    3750 6050
	-1   0    0    -1  
$EndComp
Text GLabel 1450 5550 0    50   BiDi ~ 0
D0
Text GLabel 1450 5650 0    50   BiDi ~ 0
D1
Text GLabel 1450 5750 0    50   BiDi ~ 0
D2
Text GLabel 1450 5850 0    50   BiDi ~ 0
D3
Text GLabel 1450 5950 0    50   BiDi ~ 0
D4
Text GLabel 1450 6050 0    50   BiDi ~ 0
D5
Text GLabel 1450 6150 0    50   BiDi ~ 0
D6
Text GLabel 1450 6250 0    50   BiDi ~ 0
D7
Text GLabel 3250 6250 0    50   BiDi ~ 0
D8
Text GLabel 3250 6150 0    50   BiDi ~ 0
D9
Text GLabel 3250 6050 0    50   BiDi ~ 0
D10
Text GLabel 3250 5950 0    50   BiDi ~ 0
D11
Text GLabel 3250 5850 0    50   BiDi ~ 0
D12
Text GLabel 3250 5750 0    50   BiDi ~ 0
D13
Text GLabel 3250 5650 0    50   BiDi ~ 0
D14
Text GLabel 3250 5550 0    50   BiDi ~ 0
D15
Wire Wire Line
	1950 5150 1950 5250
Wire Wire Line
	3750 5150 3750 5250
Text GLabel 2450 5550 2    50   BiDi ~ 0
BD0
Text GLabel 2450 5650 2    50   BiDi ~ 0
BD1
Text GLabel 2450 5750 2    50   BiDi ~ 0
BD2
Text GLabel 2450 5850 2    50   BiDi ~ 0
BD3
Text GLabel 2450 5950 2    50   BiDi ~ 0
BD4
Text GLabel 2450 6050 2    50   BiDi ~ 0
BD5
Text GLabel 2450 6150 2    50   BiDi ~ 0
BD6
Text GLabel 2450 6250 2    50   BiDi ~ 0
BD7
Text GLabel 4250 6250 2    50   BiDi ~ 0
BD8
Text GLabel 4250 6150 2    50   BiDi ~ 0
BD9
Text GLabel 4250 6050 2    50   BiDi ~ 0
BD10
Text GLabel 4250 5950 2    50   BiDi ~ 0
BD11
Text GLabel 4250 5850 2    50   BiDi ~ 0
BD12
Text GLabel 4250 5750 2    50   BiDi ~ 0
BD13
Text GLabel 4250 5650 2    50   BiDi ~ 0
BD14
Text GLabel 4250 5550 2    50   BiDi ~ 0
BD15
Text GLabel 9150 4400 0    50   BiDi ~ 0
BD0
Text GLabel 9150 4300 0    50   BiDi ~ 0
BD1
Text GLabel 9150 4200 0    50   BiDi ~ 0
BD2
Text GLabel 9150 4100 0    50   BiDi ~ 0
BD3
Text GLabel 9150 4000 0    50   BiDi ~ 0
BD4
Text GLabel 9150 3900 0    50   BiDi ~ 0
BD5
Text GLabel 9150 3800 0    50   BiDi ~ 0
BD6
Text GLabel 9150 3700 0    50   BiDi ~ 0
BD7
Text GLabel 9650 3700 2    50   BiDi ~ 0
BD8
Text GLabel 9650 3800 2    50   BiDi ~ 0
BD9
Text GLabel 9650 3900 2    50   BiDi ~ 0
BD10
Text GLabel 9650 4000 2    50   BiDi ~ 0
BD11
Text GLabel 9650 4100 2    50   BiDi ~ 0
BD12
Text GLabel 9650 4200 2    50   BiDi ~ 0
BD13
Text GLabel 9650 4300 2    50   BiDi ~ 0
BD14
Text GLabel 9650 4400 2    50   BiDi ~ 0
BD15
Wire Wire Line
	10150 3600 9650 3600
Wire Wire Line
	9650 4600 10150 4600
Connection ~ 10150 4600
Wire Wire Line
	10150 4600 10150 3600
Wire Wire Line
	9650 4700 10150 4700
Connection ~ 10150 4700
Wire Wire Line
	10150 4700 10150 4600
Wire Wire Line
	9650 4800 10150 4800
Connection ~ 10150 4800
Wire Wire Line
	10150 4800 10150 4700
Wire Wire Line
	9650 5000 10150 5000
Connection ~ 10150 5000
Wire Wire Line
	9650 5500 10150 5500
Connection ~ 10150 5500
Wire Wire Line
	10150 5500 10150 5000
Wire Wire Line
	9150 4500 8250 4500
Text GLabel 2450 6450 2    50   Input ~ 0
R~W~
Text GLabel 4250 6450 2    50   Input ~ 0
R~W~
Text GLabel 9150 3600 0    50   Input ~ 0
~BRESET~
Text GLabel 9150 4700 0    50   Input ~ 0
~WR~
Text GLabel 9000 4800 0    50   Input ~ 0
~RD~
Text GLabel 8900 5400 0    50   Input ~ 0
~CS1~
Text GLabel 9850 5400 2    50   Input ~ 0
~CS3~
Text GLabel 9150 5300 0    50   Input ~ 0
BA0
Text GLabel 9150 5200 0    50   Input ~ 0
BA1
Text GLabel 9650 5300 2    50   Input ~ 0
BA2
NoConn ~ 9650 5200
NoConn ~ 9650 5100
Wire Wire Line
	8400 4850 8400 5000
$Comp
L Device:R R3
U 1 1 60264D8B
P 6750 5700
F 0 "R3" V 6650 5650 50  0000 L CNN
F 1 "10k" V 6850 5650 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6680 5700 50  0001 C CNN
F 3 "~" H 6750 5700 50  0001 C CNN
	1    6750 5700
	0    -1   1    0   
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 60266EFD
P 10550 4500
F 0 "JP1" H 10550 4764 50  0000 C CNN
F 1 "Pin 20 5V Supply" H 10550 4673 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 10550 4500 50  0001 C CNN
F 3 "~" H 10550 4500 50  0001 C CNN
	1    10550 4500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10950 4500 10850 4500
Wire Wire Line
	10950 4350 10950 4500
Wire Wire Line
	10250 4500 9650 4500
Text GLabel 9150 5100 0    50   Output ~ 0
INTRQ
$Comp
L Logic_Programmable:GAL16V8 U1
U 1 1 6026C51E
P 4250 2150
F 0 "U1" H 3950 2750 50  0000 C CNN
F 1 "16V8" H 4450 2750 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm_Socket_LongPads" H 4250 2150 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/30132.pdf" H 4250 2150 50  0001 C CNN
F 4 "uk.farnell.com 1551768" H 4250 2150 50  0001 C CNN "Vendor"
	1    4250 2150
	1    0    0    -1  
$EndComp
Text GLabel 3750 1950 0    50   Input ~ 0
A14
Text GLabel 3750 2050 0    50   Input ~ 0
A13
Text GLabel 3750 2150 0    50   Input ~ 0
A12
Text GLabel 3750 2250 0    50   Input ~ 0
A11
Text GLabel 3750 2350 0    50   Input ~ 0
A10
Text GLabel 3750 2450 0    50   Input ~ 0
A9
Text GLabel 4750 2050 2    50   Input ~ 0
A8
Text GLabel 4750 2150 2    50   Input ~ 0
A7
Text GLabel 4750 2250 2    50   Input ~ 0
A6
Text GLabel 3750 1850 0    50   Input ~ 0
A15
Text GLabel 3750 1750 0    50   Input ~ 0
A16
Text GLabel 3750 1650 0    50   Input ~ 0
A17
Text GLabel 3600 2550 0    50   Input ~ 0
~IOSEL~
Text GLabel 4750 1650 2    50   Output ~ 0
~SELECT~
Text GLabel 5950 1750 0    50   Input ~ 0
A4
Text GLabel 5950 2250 0    50   Input ~ 0
~UDS~
Text GLabel 5750 2150 0    50   Input ~ 0
~LDS~
Text GLabel 7300 2050 2    50   Output ~ 0
~RD~
Text GLabel 6950 2150 2    50   Output ~ 0
~WR~
Text GLabel 7300 2250 2    50   Output ~ 0
~CS1~
Text GLabel 6950 2350 2    50   Output ~ 0
~CS3~
Text GLabel 8500 2600 0    50   Input ~ 0
INTRQ
Text GLabel 5950 2050 0    50   Input ~ 0
FC2
Text GLabel 5950 1950 0    50   Input ~ 0
FC1
Text GLabel 5950 1850 0    50   Input ~ 0
FC0
Text GLabel 5950 2550 0    50   Input ~ 0
A1
Text GLabel 5950 2450 0    50   Input ~ 0
A2
Text GLabel 4750 2350 2    50   Input ~ 0
A5
Text GLabel 6950 2550 2    50   Output ~ 0
~VPA~
Text GLabel 7300 2450 2    50   Input ~ 0
~SELECT~
Wire Wire Line
	2250 1000 2500 1000
Wire Wire Line
	2250 1200 2500 1200
$Comp
L Device:C C1
U 1 1 602DECD9
P 4650 4300
F 0 "C1" H 4765 4346 50  0000 L CNN
F 1 "100n" H 4765 4255 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 4688 4150 50  0001 C CNN
F 3 "~" H 4650 4300 50  0001 C CNN
	1    4650 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 602E0ED1
P 5050 4300
F 0 "C2" H 5165 4346 50  0000 L CNN
F 1 "100n" H 5165 4255 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 5088 4150 50  0001 C CNN
F 3 "~" H 5050 4300 50  0001 C CNN
	1    5050 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 602E1D4A
P 5450 4300
F 0 "C3" H 5565 4346 50  0000 L CNN
F 1 "100n" H 5565 4255 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 5488 4150 50  0001 C CNN
F 3 "~" H 5450 4300 50  0001 C CNN
	1    5450 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 602E2BBD
P 5850 4300
F 0 "C4" H 5965 4346 50  0000 L CNN
F 1 "100n" H 5965 4255 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 5888 4150 50  0001 C CNN
F 3 "~" H 5850 4300 50  0001 C CNN
	1    5850 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 602E3B77
P 6250 4300
F 0 "C5" H 6365 4346 50  0000 L CNN
F 1 "100n" H 6365 4255 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 6288 4150 50  0001 C CNN
F 3 "~" H 6250 4300 50  0001 C CNN
	1    6250 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C7
U 1 1 602E832C
P 7050 4300
F 0 "C7" H 7168 4346 50  0000 L CNN
F 1 "100u" H 7168 4255 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D8.0mm_P2.50mm" H 7088 4150 50  0001 C CNN
F 3 "~" H 7050 4300 50  0001 C CNN
	1    7050 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4450 4650 4550
Wire Wire Line
	4650 4550 5050 4550
Wire Wire Line
	5050 4550 5050 4450
Connection ~ 4650 4550
Wire Wire Line
	5050 4550 5450 4550
Wire Wire Line
	5450 4550 5450 4450
Connection ~ 5050 4550
Wire Wire Line
	5450 4550 5850 4550
Wire Wire Line
	5850 4550 5850 4450
Connection ~ 5450 4550
Wire Wire Line
	5850 4550 6250 4550
Wire Wire Line
	6250 4550 6250 4450
Connection ~ 5850 4550
Wire Wire Line
	7050 4550 7050 4450
Wire Wire Line
	4650 4050 5050 4050
Wire Wire Line
	5050 4050 5050 4150
Connection ~ 4650 4050
Wire Wire Line
	4650 4050 4650 4150
Wire Wire Line
	5050 4050 5450 4050
Wire Wire Line
	5450 4050 5450 4150
Connection ~ 5050 4050
Wire Wire Line
	5450 4050 5850 4050
Wire Wire Line
	5850 4050 5850 4150
Connection ~ 5450 4050
Wire Wire Line
	5850 4050 6250 4050
Wire Wire Line
	6250 4050 6250 4150
Connection ~ 5850 4050
Wire Wire Line
	7050 4050 7050 4150
$Comp
L Device:C C6
U 1 1 602F8250
P 6650 4300
F 0 "C6" H 6765 4346 50  0000 L CNN
F 1 "1u" H 6765 4255 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L7.0mm_W4.5mm_P5.00mm" H 6688 4150 50  0001 C CNN
F 3 "~" H 6650 4300 50  0001 C CNN
	1    6650 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4050 6650 4150
Wire Wire Line
	6650 4550 6650 4450
$Comp
L Device:CP C8
U 1 1 602FD673
P 7450 4300
F 0 "C8" H 7568 4346 50  0000 L CNN
F 1 "10u" H 7568 4255 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D8.0mm_P2.50mm" H 7488 4150 50  0001 C CNN
F 3 "~" H 7450 4300 50  0001 C CNN
	1    7450 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 4050 7450 4050
Wire Wire Line
	7450 4050 7450 4150
Connection ~ 7050 4050
Wire Wire Line
	7050 4550 7450 4550
Wire Wire Line
	7450 4550 7450 4450
Connection ~ 7050 4550
Text GLabel 2250 1100 2    50   Output ~ 0
CLOCK
Text GLabel 5950 1650 0    50   Input ~ 0
CLOCK
Text GLabel 2250 2300 2    50   3State ~ 0
~IPL1~
Text GLabel 5950 2350 0    50   Input ~ 0
A3
$Comp
L power:+5V #PWR01
U 1 1 6032CDCA
P 2700 900
F 0 "#PWR01" H 2700 750 50  0001 C CNN
F 1 "+5V" H 2715 1073 50  0000 C CNN
F 2 "" H 2700 900 50  0001 C CNN
F 3 "" H 2700 900 50  0001 C CNN
	1    2700 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 60358D74
P 2700 1300
F 0 "#PWR03" H 2700 1050 50  0001 C CNN
F 1 "GND" H 2705 1127 50  0000 C CNN
F 2 "" H 2700 1300 50  0001 C CNN
F 3 "" H 2700 1300 50  0001 C CNN
	1    2700 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1200 2700 1300
Wire Wire Line
	2500 1200 2700 1200
Wire Wire Line
	2700 1000 2700 900 
Wire Wire Line
	2500 1000 2700 1000
$Comp
L power:GND #PWR021
U 1 1 6036156C
P 1950 6950
F 0 "#PWR021" H 1950 6700 50  0001 C CNN
F 1 "GND" H 1955 6777 50  0000 C CNN
F 2 "" H 1950 6950 50  0001 C CNN
F 3 "" H 1950 6950 50  0001 C CNN
	1    1950 6950
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 6036333D
P 3750 6950
F 0 "#PWR022" H 3750 6700 50  0001 C CNN
F 1 "GND" H 3755 6777 50  0000 C CNN
F 2 "" H 3750 6950 50  0001 C CNN
F 3 "" H 3750 6950 50  0001 C CNN
	1    3750 6950
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 6036ADA5
P 4650 4750
F 0 "#PWR012" H 4650 4500 50  0001 C CNN
F 1 "GND" H 4655 4577 50  0000 C CNN
F 2 "" H 4650 4750 50  0001 C CNN
F 3 "" H 4650 4750 50  0001 C CNN
	1    4650 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 6036BF5E
P 6450 3150
F 0 "#PWR09" H 6450 2900 50  0001 C CNN
F 1 "GND" H 6455 2977 50  0000 C CNN
F 2 "" H 6450 3150 50  0001 C CNN
F 3 "" H 6450 3150 50  0001 C CNN
	1    6450 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 6036C9F8
P 4250 2950
F 0 "#PWR06" H 4250 2700 50  0001 C CNN
F 1 "GND" H 4255 2777 50  0000 C CNN
F 2 "" H 4250 2950 50  0001 C CNN
F 3 "" H 4250 2950 50  0001 C CNN
	1    4250 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 60372AA1
P 10150 5650
F 0 "#PWR019" H 10150 5400 50  0001 C CNN
F 1 "GND" H 10155 5477 50  0000 C CNN
F 2 "" H 10150 5650 50  0001 C CNN
F 3 "" H 10150 5650 50  0001 C CNN
	1    10150 5650
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR016
U 1 1 60374949
P 1950 5150
F 0 "#PWR016" H 1950 5000 50  0001 C CNN
F 1 "+5V" H 1965 5323 50  0000 C CNN
F 2 "" H 1950 5150 50  0001 C CNN
F 3 "" H 1950 5150 50  0001 C CNN
	1    1950 5150
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 60376818
P 3750 5150
F 0 "#PWR017" H 3750 5000 50  0001 C CNN
F 1 "+5V" H 3765 5323 50  0000 C CNN
F 2 "" H 3750 5150 50  0001 C CNN
F 3 "" H 3750 5150 50  0001 C CNN
	1    3750 5150
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 6037744D
P 10950 4350
F 0 "#PWR011" H 10950 4200 50  0001 C CNN
F 1 "+5V" H 10965 4523 50  0000 C CNN
F 2 "" H 10950 4350 50  0001 C CNN
F 3 "" H 10950 4350 50  0001 C CNN
	1    10950 4350
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 60379F2C
P 4250 1300
F 0 "#PWR04" H 4250 1150 50  0001 C CNN
F 1 "+5V" H 4265 1473 50  0000 C CNN
F 2 "" H 4250 1300 50  0001 C CNN
F 3 "" H 4250 1300 50  0001 C CNN
	1    4250 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 6037AFE4
P 6450 1300
F 0 "#PWR05" H 6450 1150 50  0001 C CNN
F 1 "+5V" H 6465 1473 50  0000 C CNN
F 2 "" H 6450 1300 50  0001 C CNN
F 3 "" H 6450 1300 50  0001 C CNN
	1    6450 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 6037BF20
P 4650 3800
F 0 "#PWR010" H 4650 3650 50  0001 C CNN
F 1 "+5V" H 4665 3973 50  0000 C CNN
F 2 "" H 4650 3800 50  0001 C CNN
F 3 "" H 4650 3800 50  0001 C CNN
	1    4650 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 6850 1950 6950
Wire Wire Line
	3750 6850 3750 6950
$Comp
L power:+5V #PWR013
U 1 1 6038AA98
P 8400 4850
F 0 "#PWR013" H 8400 4700 50  0001 C CNN
F 1 "+5V" H 8415 5023 50  0000 C CNN
F 2 "" H 8400 4850 50  0001 C CNN
F 3 "" H 8400 4850 50  0001 C CNN
	1    8400 4850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4650 3800 4650 4050
Wire Wire Line
	4650 4550 4650 4750
Wire Wire Line
	4250 1300 4250 1450
Wire Wire Line
	4250 2850 4250 2950
Wire Wire Line
	6450 3050 6450 3150
Text GLabel 9600 1750 2    50   Output ~ 0
BA0
Text GLabel 9600 1850 2    50   Output ~ 0
BA1
Text GLabel 9600 1950 2    50   Output ~ 0
BA2
Text GLabel 9900 2050 2    50   Output ~ 0
~BRESET~
Text GLabel 8500 1750 0    50   Input ~ 0
A1
Text GLabel 8500 1850 0    50   Input ~ 0
A2
Text GLabel 8500 1950 0    50   Input ~ 0
A3
Text GLabel 8350 2050 0    50   Input ~ 0
~RESET~
Text GLabel 10250 2600 2    50   Output ~ 0
~IPL0~
Text GLabel 10250 2900 2    50   Output ~ 0
~IPL1~
Connection ~ 6650 4050
Connection ~ 6650 4550
Wire Wire Line
	6650 4050 7050 4050
Wire Wire Line
	6650 4550 7050 4550
Wire Wire Line
	6450 1300 6450 1450
NoConn ~ 1750 3400
Wire Wire Line
	6250 4050 6650 4050
Connection ~ 6250 4050
Wire Wire Line
	6250 4550 6650 4550
Connection ~ 6250 4550
Wire Wire Line
	10150 4800 10150 5000
$Comp
L power:GND #PWR015
U 1 1 602D7460
P 10950 5100
F 0 "#PWR015" H 10950 4850 50  0001 C CNN
F 1 "GND" H 10955 4927 50  0000 C CNN
F 2 "" H 10950 5100 50  0001 C CNN
F 3 "" H 10950 5100 50  0001 C CNN
	1    10950 5100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10950 4900 10950 5100
Wire Wire Line
	8850 5000 9150 5000
NoConn ~ 9150 4900
Wire Wire Line
	8550 5000 8400 5000
$Comp
L Device:R R1
U 1 1 6026136B
P 8700 5000
F 0 "R1" V 8493 5000 50  0000 C CNN
F 1 "10k" V 8584 5000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8630 5000 50  0001 C CNN
F 3 "~" H 8700 5000 50  0001 C CNN
	1    8700 5000
	0    -1   1    0   
$EndComp
Text Label 8900 5000 0    50   ~ 0
DMACK
NoConn ~ 9150 4600
Text Label 9650 4900 0    50   ~ 0
CSEL
Text Label 9150 4600 2    50   ~ 0
DMARQ
$Comp
L Connector:TestPoint TP1
U 1 1 6029B3A2
P 5050 4050
F 0 "TP1" H 5108 4168 50  0000 L CNN
F 1 "TestPoint" H 4900 4250 50  0000 L CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Big" H 5250 4050 50  0001 C CNN
F 3 "~" H 5250 4050 50  0001 C CNN
	1    5050 4050
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 6029CC8A
P 5050 4550
F 0 "TP2" H 5000 4700 50  0000 R CNN
F 1 "TestPoint" H 5200 4800 50  0000 R CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Big" H 5250 4550 50  0001 C CNN
F 3 "~" H 5250 4550 50  0001 C CNN
	1    5050 4550
	-1   0    0    1   
$EndComp
Text Notes 6600 1350 0    50   ~ 0
NOTE: This ATF750 may be replaced with an\n22V10 if less complex logic is required,e.g. if\nsimpler ~RD~ and ~DTACK~ logic is required.
Wire Wire Line
	5750 2150 5950 2150
Wire Wire Line
	9600 2050 9900 2050
Wire Wire Line
	8350 2050 8500 2050
Wire Wire Line
	2250 2600 2550 2600
Wire Wire Line
	2250 2200 2500 2200
Wire Wire Line
	9650 5400 9850 5400
Wire Wire Line
	2450 6550 2600 6550
Wire Wire Line
	4250 6550 4400 6550
Wire Wire Line
	9000 4800 9150 4800
Text Notes 9500 1350 0    50   ~ 0
The "A" group are simple buffers.\nThe "B" group simulate open-collector\noutputs, by either asserting low output\nor becoming high-impedance.
Wire Wire Line
	10150 5500 10150 5650
$Comp
L Device:R R4
U 1 1 602C75C9
P 6200 6550
F 0 "R4" H 6250 6500 50  0000 L CNN
F 1 "330" H 6250 6600 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6130 6550 50  0001 C CNN
F 3 "~" H 6200 6550 50  0001 C CNN
	1    6200 6550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR020
U 1 1 602D4EDD
P 6200 6800
F 0 "#PWR020" H 6200 6550 50  0001 C CNN
F 1 "GND" H 6205 6627 50  0000 C CNN
F 2 "" H 6200 6800 50  0001 C CNN
F 3 "" H 6200 6800 50  0001 C CNN
	1    6200 6800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6200 5200 6200 5250
$Comp
L power:+5V #PWR018
U 1 1 602DEF83
P 6200 5200
F 0 "#PWR018" H 6200 5050 50  0001 C CNN
F 1 "+5V" H 6215 5373 50  0000 C CNN
F 2 "" H 6200 5200 50  0001 C CNN
F 3 "" H 6200 5200 50  0001 C CNN
	1    6200 5200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6950 5700 7050 5700
Connection ~ 6200 5250
Wire Wire Line
	6200 5250 6200 5500
Wire Wire Line
	6200 5900 6200 6000
Wire Wire Line
	6200 6300 6200 6400
Wire Wire Line
	6200 6700 6200 6800
$Comp
L Device:R R2
U 1 1 602CA347
P 6950 5450
F 0 "R2" H 6800 5500 50  0000 L CNN
F 1 "4k7" H 6750 5400 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6880 5450 50  0001 C CNN
F 3 "~" H 6950 5450 50  0001 C CNN
	1    6950 5450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6950 5250 6950 5300
Wire Wire Line
	6200 5250 6950 5250
Wire Wire Line
	6950 5600 6950 5700
Wire Wire Line
	6900 5700 6950 5700
Connection ~ 6950 5700
Text GLabel 9150 5500 0    50   Output ~ 0
~DASP~
Wire Wire Line
	8900 5400 9150 5400
Text GLabel 7050 5700 2    50   Input ~ 0
~DASP~
Wire Wire Line
	6600 5700 6500 5700
$Comp
L power:GND #PWR014
U 1 1 603C6218
P 8250 5050
F 0 "#PWR014" H 8250 4800 50  0001 C CNN
F 1 "GND" H 8255 4877 50  0000 C CNN
F 2 "" H 8250 5050 50  0001 C CNN
F 3 "" H 8250 5050 50  0001 C CNN
	1    8250 5050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8250 4500 8250 5050
Wire Wire Line
	6950 2050 7300 2050
Wire Wire Line
	6950 2250 7300 2250
Text GLabel 6950 1950 2    50   Output ~ 0
~USEL~
Text GLabel 7300 1850 2    50   Output ~ 0
~LSEL~
Text GLabel 4400 6550 2    50   Input ~ 0
~USEL~
Text GLabel 2600 6550 2    50   Input ~ 0
~LSEL~
Wire Wire Line
	6950 2450 7300 2450
Wire Wire Line
	6950 1850 7300 1850
NoConn ~ 4750 1850
NoConn ~ 4750 1950
Text Notes 4400 1450 0    50   ~ 0
With ~SELECT~ and A[17..5], we have\nenough for complete decoding.\nThis device will not have any shadow\ninstances of itself in the memory map.
$Comp
L Graphic:Logo_Open_Hardware_Small #LOGO1
U 1 1 602B4F2E
P 6600 7450
F 0 "#LOGO1" H 6600 7725 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 6600 7225 50  0001 C CNN
F 2 "" H 6600 7450 50  0001 C CNN
F 3 "~" H 6600 7450 50  0001 C CNN
	1    6600 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 3900 1750 3900
NoConn ~ 4750 1750
Wire Wire Line
	3600 2550 3750 2550
Text GLabel 5950 2750 0    50   Input ~ 0
R~W~
Text GLabel 6950 1750 2    50   Output ~ 0
~DTACK~
$Comp
L Connector:TestPoint TP3
U 1 1 604AB6B3
P 5450 4550
F 0 "TP3" H 5400 4700 50  0000 R CNN
F 1 "TestPoint" H 5600 4800 50  0000 R CNN
F 2 "Measurement_Points:Measurement_Point_Round-TH_Big" H 5650 4550 50  0001 C CNN
F 3 "~" H 5650 4550 50  0001 C CNN
	1    5450 4550
	-1   0    0    1   
$EndComp
$Comp
L 74xx_IEEE:74LS241 U3
U 1 1 604D1B88
P 9050 1850
F 0 "U3" H 9050 2466 50  0000 C CNN
F 1 "74HCT241" H 9050 2375 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm_Socket_LongPads" H 9050 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls241.pdf" H 9050 1850 50  0001 C CNN
F 4 "uk.farnell.com 3006090" H 9050 1850 50  0001 C CNN "Vendor"
	1    9050 1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx_IEEE:74LS241 U3
U 2 1 604D4B64
P 9050 2900
F 0 "U3" H 9050 3516 50  0000 C CNN
F 1 "74HCT241" H 9050 3425 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm_Socket_LongPads" H 9050 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls241.pdf" H 9050 2900 50  0001 C CNN
F 4 "uk.farnell.com 3006090" H 9050 2900 50  0001 C CNN "Vendor"
	2    9050 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6050335F
P 8150 1700
F 0 "#PWR0101" H 8150 1450 50  0001 C CNN
F 1 "GND" H 8155 1527 50  0000 C CNN
F 2 "" H 8150 1700 50  0001 C CNN
F 3 "" H 8150 1700 50  0001 C CNN
	1    8150 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 1550 8150 1550
Wire Wire Line
	8150 1550 8150 1700
Text GLabel 10250 3200 2    50   Output ~ 0
~IPL2~
Text GLabel 2500 2400 2    50   BiDi ~ 0
~IPL2~
Wire Wire Line
	2250 2400 2500 2400
Wire Wire Line
	10050 2600 10250 2600
Wire Wire Line
	10050 2900 10250 2900
Wire Wire Line
	10050 3200 10250 3200
Wire Wire Line
	8500 2800 8350 2800
Wire Wire Line
	8350 2800 8350 2900
Wire Wire Line
	8500 2900 8350 2900
Connection ~ 8350 2900
Wire Wire Line
	8350 2900 8350 3000
Wire Wire Line
	8500 3000 8350 3000
Connection ~ 8350 3000
Wire Wire Line
	8350 3000 8350 3100
Wire Wire Line
	8500 3100 8350 3100
Connection ~ 8350 3100
$Comp
L power:GND #PWR0102
U 1 1 6054F644
P 8350 3300
F 0 "#PWR0102" H 8350 3050 50  0001 C CNN
F 1 "GND" H 8355 3127 50  0000 C CNN
F 2 "" H 8350 3300 50  0001 C CNN
F 3 "" H 8350 3300 50  0001 C CNN
	1    8350 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 3100 8350 3300
NoConn ~ 9600 3100
$Comp
L local_library:GAL22V10 U2
U 1 1 60293B31
P 6450 2150
F 0 "U2" H 6150 2750 50  0000 C CNN
F 1 "ATF750" H 6700 2750 50  0000 C CNN
F 2 "Housings_DIP:DIP-24_W7.62mm_Socket_LongPads" H 6450 2150 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1627044.pdf" H 6450 2150 50  0001 C CNN
F 4 "uk.farnell.com 3580674" H 6450 2150 50  0001 C CNN "Vendor"
	1    6450 2150
	1    0    0    -1  
$EndComp
NoConn ~ 6950 1650
Wire Wire Line
	9600 2900 9750 2900
Wire Wire Line
	9600 2800 9700 2800
Wire Wire Line
	9700 2800 9700 2600
Wire Wire Line
	9700 2600 9750 2600
Wire Wire Line
	9600 3000 9700 3000
Wire Wire Line
	9700 3000 9700 3200
Wire Wire Line
	9700 3200 9750 3200
$Comp
L power:VCC #PWR0103
U 1 1 6060BB31
P 4450 3800
F 0 "#PWR0103" H 4450 3650 50  0001 C CNN
F 1 "VCC" H 4465 3973 50  0000 C CNN
F 2 "" H 4450 3800 50  0001 C CNN
F 3 "" H 4450 3800 50  0001 C CNN
	1    4450 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3800 4450 4050
Wire Wire Line
	4450 4050 4650 4050
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 6064DE34
P 9900 2600
F 0 "JP3" H 9900 2805 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 10150 2700 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 9900 2600 50  0001 C CNN
F 3 "~" H 9900 2600 50  0001 C CNN
	1    9900 2600
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 6064FE61
P 9900 2900
F 0 "JP4" H 9900 3105 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 10150 3000 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 9900 2900 50  0001 C CNN
F 3 "~" H 9900 2900 50  0001 C CNN
	1    9900 2900
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP5
U 1 1 60650BAE
P 9900 3200
F 0 "JP5" H 9900 3405 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 10150 3300 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 9900 3200 50  0001 C CNN
F 3 "~" H 9900 3200 50  0001 C CNN
	1    9900 3200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x32_Odd_Even J1
U 1 1 5EB06E33
P 2050 2500
F 0 "J1" H 2050 4100 50  0000 C CNN
F 1 "Conn_02x32_Odd_Even" H 2100 800 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x32_P2.54mm_Vertical" H 2050 2500 50  0001 C CNN
F 3 "https://www.we-online.de/katalog/datasheet/613064243121.pdf" H 2050 2500 50  0001 C CNN
F 4 "uk.farnell.com 2984322" H 2050 2500 50  0001 C CNN "Vendor"
	1    2050 2500
	-1   0    0    -1  
$EndComp
NoConn ~ 1750 3300
NoConn ~ 5950 2650
Wire Wire Line
	9650 4900 10400 4900
Wire Wire Line
	10700 4900 10950 4900
$Comp
L Jumper:SolderJumper_2_Bridged JP2
U 1 1 60585F08
P 10550 4900
F 0 "JP2" H 10550 5105 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 10700 5000 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_Pad1.0x1.5mm" H 10550 4900 50  0001 C CNN
F 3 "~" H 10550 4900 50  0001 C CNN
	1    10550 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 602632F6
P 6200 6150
F 0 "D1" V 6150 6300 50  0000 C CNN
F 1 "LED" V 6250 6300 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 6200 6150 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1811043.pdf" H 6200 6150 50  0001 C CNN
F 4 " uk.farnellcom 3218450" V 6200 6150 50  0001 C CNN "Vendor"
	1    6200 6150
	0    1    -1   0   
$EndComp
$Comp
L Device:Q_PNP_EBC Q1
U 1 1 602BAD8B
P 6300 5700
F 0 "Q1" H 6491 5654 50  0000 L CNN
F 1 "2N2907" H 6491 5745 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-18-3" H 6500 5800 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2869790.pdf" H 6300 5700 50  0001 C CNN
F 4 "uk.farnell.com 9206892" H 6300 5700 50  0001 C CNN "Vendor"
	1    6300 5700
	-1   0    0    1   
$EndComp
Text Notes 5000 6100 0    50   ~ 0
This transistor is non-critical.\nMost PNP pin-compatible\nreplacements will work.
$EndSCHEMATC
