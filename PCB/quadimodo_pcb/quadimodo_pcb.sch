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
L MCU_Module:WeMos_D1_mini U1
U 1 1 60713E45
P 4050 3700
F 0 "U1" H 4050 2811 50  0000 C CNN
F 1 "WeMos_D1_mini" H 4050 2720 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 4050 2550 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 2200 2550 50  0001 C CNN
	1    4050 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 6071A2EB
P 5000 4350
F 0 "R2" H 5050 4400 50  0000 L CNN
F 1 "10K" H 5050 4300 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4930 4350 50  0001 C CNN
F 3 "~" H 5000 4350 50  0001 C CNN
	1    5000 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6071A8BF
P 5000 4700
F 0 "#PWR0101" H 5000 4450 50  0001 C CNN
F 1 "GND" H 5005 4527 50  0000 C CNN
F 2 "" H 5000 4700 50  0001 C CNN
F 3 "" H 5000 4700 50  0001 C CNN
	1    5000 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 4100 5000 4100
Wire Wire Line
	5000 4200 5000 4100
$Comp
L Device:R R7
U 1 1 60729391
P 7800 3800
F 0 "R7" V 7750 3800 50  0000 C CNN
F 1 "100" V 7800 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7730 3800 50  0001 C CNN
F 3 "~" H 7800 3800 50  0001 C CNN
	1    7800 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 607293FF
P 8100 4350
F 0 "R8" H 8150 4400 50  0000 L CNN
F 1 "10K" H 8150 4300 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8030 4350 50  0001 C CNN
F 3 "~" H 8100 4350 50  0001 C CNN
	1    8100 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 60729409
P 8100 4700
F 0 "#PWR0102" H 8100 4450 50  0001 C CNN
F 1 "GND" H 8105 4527 50  0000 C CNN
F 2 "" H 8100 4700 50  0001 C CNN
F 3 "" H 8100 4700 50  0001 C CNN
	1    8100 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 60730067
P 5850 4000
F 0 "R3" V 5800 4000 50  0000 C CNN
F 1 "100" V 5850 4000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5780 4000 50  0001 C CNN
F 3 "~" H 5850 4000 50  0001 C CNN
	1    5850 4000
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 60730101
P 6100 4350
F 0 "R5" H 6150 4400 50  0000 L CNN
F 1 "10K" H 6150 4300 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6030 4350 50  0001 C CNN
F 3 "~" H 6100 4350 50  0001 C CNN
	1    6100 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 6073010B
P 6100 4700
F 0 "#PWR0103" H 6100 4450 50  0001 C CNN
F 1 "GND" H 6105 4527 50  0000 C CNN
F 2 "" H 6100 4700 50  0001 C CNN
F 3 "" H 6100 4700 50  0001 C CNN
	1    6100 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 60737969
P 6750 3900
F 0 "R4" V 6700 3900 50  0000 C CNN
F 1 "100" V 6750 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6680 3900 50  0001 C CNN
F 3 "~" H 6750 3900 50  0001 C CNN
	1    6750 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 60737A2F
P 7050 4350
F 0 "R6" H 7100 4400 50  0000 L CNN
F 1 "10K" H 7100 4300 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6980 4350 50  0001 C CNN
F 3 "~" H 7050 4350 50  0001 C CNN
	1    7050 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 60737A39
P 7050 4700
F 0 "#PWR0104" H 7050 4450 50  0001 C CNN
F 1 "GND" H 7055 4527 50  0000 C CNN
F 2 "" H 7050 4700 50  0001 C CNN
F 3 "" H 7050 4700 50  0001 C CNN
	1    7050 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 60719C77
P 4750 4100
F 0 "R1" V 4700 4100 50  0000 C CNN
F 1 "100" V 4750 4100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4680 4100 50  0001 C CNN
F 3 "~" H 4750 4100 50  0001 C CNN
	1    4750 4100
	0    1    1    0   
$EndComp
Connection ~ 5000 4100
Wire Wire Line
	5000 4100 5300 4100
Wire Wire Line
	6100 4000 6100 4200
Wire Wire Line
	7050 3900 7050 4200
Wire Wire Line
	8100 3800 8100 4200
$Comp
L Device:CP C1
U 1 1 60758182
P 3750 2150
F 0 "C1" V 4005 2150 50  0000 C CNN
F 1 "1500uf" V 3914 2150 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P3.50mm" H 3788 2000 50  0001 C CNN
F 3 "~" H 3750 2150 50  0001 C CNN
	1    3750 2150
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D1
U 1 1 60759134
P 3200 2450
F 0 "D1" H 3200 2233 50  0000 C CNN
F 1 "D" H 3200 2324 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P10.16mm_Horizontal" H 3200 2450 50  0001 C CNN
F 3 "~" H 3200 2450 50  0001 C CNN
	1    3200 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 2900 3950 2900
Wire Wire Line
	3350 2450 3600 2450
$Comp
L power:GND #PWR0105
U 1 1 6075C8E8
P 4000 2450
F 0 "#PWR0105" H 4000 2200 50  0001 C CNN
F 1 "GND" V 4005 2322 50  0000 R CNN
F 2 "" H 4000 2450 50  0001 C CNN
F 3 "" H 4000 2450 50  0001 C CNN
	1    4000 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3900 2450 4000 2450
$Comp
L power:GND #PWR0106
U 1 1 6075DF96
P 4050 4500
F 0 "#PWR0106" H 4050 4250 50  0001 C CNN
F 1 "GND" H 4055 4327 50  0000 C CNN
F 2 "" H 4050 4500 50  0001 C CNN
F 3 "" H 4050 4500 50  0001 C CNN
	1    4050 4500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 60762582
P 2550 2450
F 0 "J1" H 2658 2631 50  0000 C CNN
F 1 "5v Power" H 2658 2540 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2550 2450 50  0001 C CNN
F 3 "~" H 2550 2450 50  0001 C CNN
	1    2550 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2450 2950 2450
$Comp
L power:GND #PWR0107
U 1 1 6076597D
P 2750 2550
F 0 "#PWR0107" H 2750 2300 50  0001 C CNN
F 1 "GND" H 2755 2377 50  0000 C CNN
F 2 "" H 2750 2550 50  0001 C CNN
F 3 "" H 2750 2550 50  0001 C CNN
	1    2750 2550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J2
U 1 1 60767104
P 5450 2350
F 0 "J2" H 5422 2232 50  0000 R CNN
F 1 "MPU6050" H 5422 2323 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5450 2350 50  0001 C CNN
F 3 "~" H 5450 2350 50  0001 C CNN
	1    5450 2350
	-1   0    0    1   
$EndComp
Wire Wire Line
	4150 2900 5250 2900
Wire Wire Line
	5250 2900 5250 2450
Wire Wire Line
	4450 3400 5150 3400
Wire Wire Line
	5150 3400 5150 2250
Wire Wire Line
	5150 2250 5250 2250
Wire Wire Line
	4450 3500 5050 3500
Wire Wire Line
	5050 3500 5050 2150
Wire Wire Line
	5050 2150 5250 2150
Wire Wire Line
	5250 2350 4950 2350
Connection ~ 3600 2450
Wire Wire Line
	3600 2150 3600 2450
Wire Wire Line
	3900 2150 3900 2450
$Comp
L SQ2310ES-T1_GE3:SQ2310ES-T1_GE3 Q1
U 1 1 6071C0F5
P 5300 4300
F 0 "Q1" V 5730 4446 50  0000 L CNN
F 1 "AO3400" V 5850 4250 50  0000 L CNN
F 2 "quadimodo_imported_footprints:SOT95P280X125-3N" H 5750 4250 50  0001 L CNN
F 3 "https://www.vishay.com/docs/67036/sq2310es.pdf" H 5750 4150 50  0001 L CNN
F 4 "Vishay SQ2310ES-T1_GE3 N-channel MOSFET, 6 A, 20 V SQ Rugged, 3-Pin SOT-23" H 5750 4050 50  0001 L CNN "Description"
F 5 "1.12" H 5750 3950 50  0001 L CNN "Height"
F 6 "Vishay" H 5750 3850 50  0001 L CNN "Manufacturer_Name"
F 7 "SQ2310ES-T1_GE3" H 5750 3750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "78-SQ2310ES-T1_GE3" H 5750 3650 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Vishay-Siliconix/SQ2310ES-T1_GE3?qs=jHkklCh7amiDWAemYtR8vg%3D%3D" H 5750 3550 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 5750 3450 50  0001 L CNN "Arrow Part Number"
F 11 "" H 5750 3350 50  0001 L CNN "Arrow Price/Stock"
F 12 " C347475" V 5300 4300 50  0001 C CNN "LCSC"
	1    5300 4300
	0    1    1    0   
$EndComp
$Comp
L SQ2310ES-T1_GE3:SQ2310ES-T1_GE3 Q2
U 1 1 60720447
P 6400 4300
F 0 "Q2" V 6875 4400 50  0000 C CNN
F 1 "AO3400" V 6950 4450 50  0000 C CNN
F 2 "quadimodo_imported_footprints:SOT95P280X125-3N" H 6850 4250 50  0001 L CNN
F 3 "https://www.vishay.com/docs/67036/sq2310es.pdf" H 6850 4150 50  0001 L CNN
F 4 "Vishay SQ2310ES-T1_GE3 N-channel MOSFET, 6 A, 20 V SQ Rugged, 3-Pin SOT-23" H 6850 4050 50  0001 L CNN "Description"
F 5 "1.12" H 6850 3950 50  0001 L CNN "Height"
F 6 "Vishay" H 6850 3850 50  0001 L CNN "Manufacturer_Name"
F 7 "SQ2310ES-T1_GE3" H 6850 3750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "78-SQ2310ES-T1_GE3" H 6850 3650 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Vishay-Siliconix/SQ2310ES-T1_GE3?qs=jHkklCh7amiDWAemYtR8vg%3D%3D" H 6850 3550 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6850 3450 50  0001 L CNN "Arrow Part Number"
F 11 "" H 6850 3350 50  0001 L CNN "Arrow Price/Stock"
F 12 " C347475" V 6400 4300 50  0001 C CNN "LCSC"
	1    6400 4300
	0    1    1    0   
$EndComp
$Comp
L SQ2310ES-T1_GE3:SQ2310ES-T1_GE3 Q3
U 1 1 60723DAC
P 7350 4300
F 0 "Q3" V 7825 4400 50  0000 C CNN
F 1 "AO3400" V 7916 4400 50  0000 C CNN
F 2 "quadimodo_imported_footprints:SOT95P280X125-3N" H 7800 4250 50  0001 L CNN
F 3 "https://www.vishay.com/docs/67036/sq2310es.pdf" H 7800 4150 50  0001 L CNN
F 4 "Vishay SQ2310ES-T1_GE3 N-channel MOSFET, 6 A, 20 V SQ Rugged, 3-Pin SOT-23" H 7800 4050 50  0001 L CNN "Description"
F 5 "1.12" H 7800 3950 50  0001 L CNN "Height"
F 6 "Vishay" H 7800 3850 50  0001 L CNN "Manufacturer_Name"
F 7 "SQ2310ES-T1_GE3" H 7800 3750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "78-SQ2310ES-T1_GE3" H 7800 3650 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Vishay-Siliconix/SQ2310ES-T1_GE3?qs=jHkklCh7amiDWAemYtR8vg%3D%3D" H 7800 3550 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 7800 3450 50  0001 L CNN "Arrow Part Number"
F 11 "" H 7800 3350 50  0001 L CNN "Arrow Price/Stock"
F 12 " C347475" V 7350 4300 50  0001 C CNN "LCSC"
	1    7350 4300
	0    1    1    0   
$EndComp
$Comp
L SQ2310ES-T1_GE3:SQ2310ES-T1_GE3 Q4
U 1 1 60724617
P 8450 4300
F 0 "Q4" V 8925 4400 50  0000 C CNN
F 1 "AO3400" V 9016 4400 50  0000 C CNN
F 2 "quadimodo_imported_footprints:SOT95P280X125-3N" H 8900 4250 50  0001 L CNN
F 3 "https://www.vishay.com/docs/67036/sq2310es.pdf" H 8900 4150 50  0001 L CNN
F 4 "Vishay SQ2310ES-T1_GE3 N-channel MOSFET, 6 A, 20 V SQ Rugged, 3-Pin SOT-23" H 8900 4050 50  0001 L CNN "Description"
F 5 "1.12" H 8900 3950 50  0001 L CNN "Height"
F 6 "Vishay" H 8900 3850 50  0001 L CNN "Manufacturer_Name"
F 7 "SQ2310ES-T1_GE3" H 8900 3750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "78-SQ2310ES-T1_GE3" H 8900 3650 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Vishay-Siliconix/SQ2310ES-T1_GE3?qs=jHkklCh7amiDWAemYtR8vg%3D%3D" H 8900 3550 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 8900 3450 50  0001 L CNN "Arrow Part Number"
F 11 "" H 8900 3350 50  0001 L CNN "Arrow Price/Stock"
F 12 " C347475" V 8450 4300 50  0001 C CNN "LCSC"
	1    8450 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 4500 5000 4600
Wire Wire Line
	5100 4600 5000 4600
Connection ~ 5000 4600
Wire Wire Line
	5000 4600 5000 4700
Wire Wire Line
	5300 4300 5300 4100
Wire Wire Line
	6000 4000 6100 4000
Wire Wire Line
	6100 4500 6100 4600
Connection ~ 6100 4600
Wire Wire Line
	6100 4600 6100 4700
Wire Wire Line
	6200 4600 6100 4600
Wire Wire Line
	6100 4000 6400 4000
Wire Wire Line
	6400 4000 6400 4300
Connection ~ 6100 4000
Wire Wire Line
	7050 3900 7350 3900
Connection ~ 7050 3900
Wire Wire Line
	6900 3900 7050 3900
Wire Wire Line
	7950 3800 8100 3800
Wire Wire Line
	7150 4600 7050 4600
Wire Wire Line
	7050 4500 7050 4600
Connection ~ 7050 4600
Wire Wire Line
	7050 4600 7050 4700
Wire Wire Line
	8100 4500 8100 4600
Wire Wire Line
	8250 4600 8100 4600
Connection ~ 8100 4600
Wire Wire Line
	8100 4600 8100 4700
Wire Wire Line
	8100 3800 8450 3800
Wire Wire Line
	8450 3800 8450 4300
Connection ~ 8100 3800
Wire Wire Line
	4950 2350 4950 3600
Wire Wire Line
	4950 3600 4450 3600
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 6082FBEC
P 5600 6400
F 0 "J3" V 5754 6212 50  0000 R CNN
F 1 "Mot2" V 5663 6212 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5600 6400 50  0001 C CNN
F 3 "~" H 5600 6400 50  0001 C CNN
	1    5600 6400
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 60831734
P 6700 6400
F 0 "J4" V 6854 6212 50  0000 R CNN
F 1 "Mot1" V 6763 6212 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6700 6400 50  0001 C CNN
F 3 "~" H 6700 6400 50  0001 C CNN
	1    6700 6400
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 60832312
P 7650 6400
F 0 "J5" V 7804 6212 50  0000 R CNN
F 1 "Mot4" V 7713 6212 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7650 6400 50  0001 C CNN
F 3 "~" H 7650 6400 50  0001 C CNN
	1    7650 6400
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 60832986
P 8750 6400
F 0 "J6" V 8904 6212 50  0000 R CNN
F 1 "Mot3" V 8813 6212 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8750 6400 50  0001 C CNN
F 3 "~" H 8750 6400 50  0001 C CNN
	1    8750 6400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5700 4600 5700 5150
Wire Wire Line
	6800 5150 6800 4600
Wire Wire Line
	7750 5150 7750 4600
Wire Wire Line
	8850 5150 8850 4600
Wire Wire Line
	3000 2450 3000 5050
Connection ~ 3000 2450
Wire Wire Line
	3000 2450 3050 2450
Wire Wire Line
	8750 5050 8750 5150
Wire Wire Line
	7650 5050 7650 5150
Connection ~ 7650 5050
Wire Wire Line
	7650 5050 8750 5050
Wire Wire Line
	6700 5050 6700 5150
Connection ~ 6700 5050
Wire Wire Line
	6700 5050 7650 5050
Wire Wire Line
	5600 5050 5600 5150
Connection ~ 5600 5050
Wire Wire Line
	5600 5050 6700 5050
Wire Wire Line
	7350 3900 7350 4300
Wire Wire Line
	4450 3900 4600 3900
Wire Wire Line
	4600 3900 4600 4100
Wire Wire Line
	6600 3900 4700 3900
Wire Wire Line
	4700 3900 4700 3950
Wire Wire Line
	4700 3950 4550 3950
Wire Wire Line
	4550 4100 4450 4100
Wire Wire Line
	4550 3950 4550 4100
Wire Wire Line
	7650 3800 4850 3800
Wire Wire Line
	4850 3800 4850 4000
Wire Wire Line
	4850 4000 4450 4000
Wire Wire Line
	5700 4000 5100 4000
Wire Wire Line
	5100 4000 5100 3850
Wire Wire Line
	5100 3850 4750 3850
Wire Wire Line
	4750 3850 4750 3800
Wire Wire Line
	4750 3800 4450 3800
$Comp
L TLV75533PDBVR:TLV75533PDBVR U2
U 1 1 6077984B
P 3800 1400
F 0 "U2" H 3800 1870 50  0000 C CNN
F 1 "TLV75533PDBVR" H 3800 1779 50  0000 C CNN
F 2 "quadimodo_imported_footprints:SOT95P280X145-5N" H 3800 1400 50  0001 L BNN
F 3 "" H 3800 1400 50  0001 L BNN
F 4 "C404027" H 3800 1400 50  0001 C CNN "LCSC"
	1    3800 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 6079419A
P 2550 1450
F 0 "J7" H 2658 1631 50  0000 C CNN
F 1 "3.9vBatt" H 2658 1540 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2550 1450 50  0001 C CNN
F 3 "~" H 2550 1450 50  0001 C CNN
	1    2550 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 60795363
P 2850 1550
F 0 "#PWR0108" H 2850 1300 50  0001 C CNN
F 1 "GND" H 2855 1377 50  0000 C CNN
F 2 "" H 2850 1550 50  0001 C CNN
F 3 "" H 2850 1550 50  0001 C CNN
	1    2850 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1550 2850 1550
Wire Wire Line
	2750 1450 2950 1450
Wire Wire Line
	2950 1450 2950 1300
$Comp
L Device:C C2
U 1 1 607A0855
P 4650 1400
F 0 "C2" H 4765 1446 50  0000 L CNN
F 1 "1uf" H 4765 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4688 1250 50  0001 C CNN
F 3 "~" H 4650 1400 50  0001 C CNN
F 4 "C28323" H 4650 1400 50  0001 C CNN "LCSC"
	1    4650 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 607A1991
P 4800 1600
F 0 "#PWR0109" H 4800 1350 50  0001 C CNN
F 1 "GND" H 4805 1427 50  0000 C CNN
F 2 "" H 4800 1600 50  0001 C CNN
F 3 "" H 4800 1600 50  0001 C CNN
	1    4800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1200 4650 1200
Wire Wire Line
	5000 1200 5000 1850
Wire Wire Line
	4150 1850 4150 2900
Connection ~ 4150 2900
Wire Wire Line
	4500 1600 4650 1600
Wire Wire Line
	4650 1550 4650 1600
Connection ~ 4650 1600
Wire Wire Line
	4650 1600 4800 1600
Wire Wire Line
	4650 1250 4650 1200
Connection ~ 4650 1200
Wire Wire Line
	4650 1200 5000 1200
$Comp
L Device:R R9
U 1 1 607B28EE
P 3100 950
F 0 "R9" H 3170 996 50  0000 L CNN
F 1 "10k" H 3170 905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3030 950 50  0001 C CNN
F 3 "~" H 3100 950 50  0001 C CNN
	1    3100 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1100 3100 1200
Wire Wire Line
	3100 800  2950 800 
Wire Wire Line
	3000 5050 5600 5050
$Comp
L Device:C C4
U 1 1 607BEA16
P 5650 5350
F 0 "C4" V 5398 5350 50  0000 C CNN
F 1 "1uf" V 5489 5350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5688 5200 50  0001 C CNN
F 3 "~" H 5650 5350 50  0001 C CNN
F 4 "C28323" V 5650 5350 50  0001 C CNN "LCSC"
	1    5650 5350
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper_NO_Small JP1
U 1 1 607C1D02
P 4600 1850
F 0 "JP1" H 4600 1650 50  0000 C CNN
F 1 "VRCONN" H 4600 1750 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4600 1850 50  0001 C CNN
F 3 "~" H 4600 1850 50  0001 C CNN
	1    4600 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 1850 5000 1850
Wire Wire Line
	4500 1850 4150 1850
$Comp
L Device:C C5
U 1 1 60803C11
P 6750 5350
F 0 "C5" V 6498 5350 50  0000 C CNN
F 1 "1uf" V 6589 5350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6788 5200 50  0001 C CNN
F 3 "~" H 6750 5350 50  0001 C CNN
F 4 "C28323" V 6750 5350 50  0001 C CNN "LCSC"
	1    6750 5350
	0    1    1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 60804F33
P 7700 5350
F 0 "C6" V 7448 5350 50  0000 C CNN
F 1 "1uf" V 7539 5350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7738 5200 50  0001 C CNN
F 3 "~" H 7700 5350 50  0001 C CNN
F 4 "C28323" V 7700 5350 50  0001 C CNN "LCSC"
	1    7700 5350
	0    1    1    0   
$EndComp
$Comp
L Device:C C7
U 1 1 608058ED
P 8800 5350
F 0 "C7" V 8548 5350 50  0000 C CNN
F 1 "1uf" V 8639 5350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8838 5200 50  0001 C CNN
F 3 "~" H 8800 5350 50  0001 C CNN
F 4 "C28323" V 8800 5350 50  0001 C CNN "LCSC"
	1    8800 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 5150 5500 5150
Wire Wire Line
	5500 5150 5500 5350
Wire Wire Line
	5500 6000 5500 6200
Wire Wire Line
	5500 6200 5600 6200
Wire Wire Line
	5700 5150 5800 5150
Wire Wire Line
	5800 5150 5800 5350
Wire Wire Line
	5800 6000 5800 6200
Wire Wire Line
	5800 6200 5700 6200
Wire Wire Line
	6700 5150 6600 5150
Wire Wire Line
	6600 5150 6600 5350
Wire Wire Line
	6900 5350 6900 5150
Wire Wire Line
	6900 5150 6800 5150
Wire Wire Line
	6900 6000 6900 6200
Wire Wire Line
	6900 6200 6800 6200
Wire Wire Line
	6700 6200 6600 6200
Wire Wire Line
	6600 6200 6600 6000
Wire Wire Line
	7650 5150 7550 5150
Wire Wire Line
	7550 5150 7550 5350
Wire Wire Line
	7550 6000 7550 6200
Wire Wire Line
	7550 6200 7650 6200
Wire Wire Line
	7750 5150 7850 5150
Wire Wire Line
	7850 5150 7850 5350
Wire Wire Line
	7850 6000 7850 6200
Wire Wire Line
	7850 6200 7750 6200
Wire Wire Line
	8750 5150 8650 5150
Wire Wire Line
	8650 5150 8650 5350
Wire Wire Line
	8650 6000 8650 6200
Wire Wire Line
	8650 6200 8750 6200
Wire Wire Line
	8850 5150 8950 5150
Wire Wire Line
	8950 5150 8950 5350
Wire Wire Line
	8950 6000 8950 6200
Wire Wire Line
	8950 6200 8850 6200
$Comp
L Device:Jumper_NO_Small JP2
U 1 1 6079208A
P 2950 1200
F 0 "JP2" V 3100 1450 50  0000 R CNN
F 1 "BCONN" V 3000 1500 50  0000 R CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2950 1200 50  0001 C CNN
F 3 "~" H 2950 1200 50  0001 C CNN
	1    2950 1200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2950 800  2950 1100
Wire Wire Line
	3100 1300 3050 1300
Wire Wire Line
	3050 1300 3050 1100
Wire Wire Line
	3050 1100 2950 1100
Connection ~ 2950 1100
Wire Wire Line
	2950 1450 2950 2450
Wire Wire Line
	2950 2450 3000 2450
Connection ~ 2950 1450
Connection ~ 2950 2450
$Comp
L SS34:SS34 D2
U 1 1 6086441C
P 5250 5750
F 0 "D2" H 5650 5483 50  0000 C CNN
F 1 "SS34" H 5650 5574 50  0000 C CNN
F 2 "quadimodo_imported_footprints:DIOM5026X262N" H 5750 5900 50  0001 L CNN
F 3 "https://www.vishay.com/docs/88751/ss32.pdf" H 5750 5800 50  0001 L CNN
F 4 "Rectifier, Schottky, SMD, 3A, 40V, DO-214AC" H 5750 5700 50  0001 L CNN "Description"
F 5 "2.62" H 5750 5600 50  0001 L CNN "Height"
F 6 "Vishay" H 5750 5500 50  0001 L CNN "Manufacturer_Name"
F 7 "SS34" H 5750 5400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 5750 5300 50  0001 L CNN "Mouser Part Number"
F 9 "" H 5750 5200 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 5750 5100 50  0001 L CNN "Arrow Part Number"
F 11 "" H 5750 5000 50  0001 L CNN "Arrow Price/Stock"
F 12 "C8678" H 5250 5750 50  0001 C CNN "LCSC"
	1    5250 5750
	1    0    0    -1  
$EndComp
$Comp
L SS34:SS34 D3
U 1 1 608448DF
P 6350 5750
F 0 "D3" H 6750 5483 50  0000 C CNN
F 1 "SS34" H 6750 5574 50  0000 C CNN
F 2 "quadimodo_imported_footprints:DIOM5026X262N" H 6850 5900 50  0001 L CNN
F 3 "https://www.vishay.com/docs/88751/ss32.pdf" H 6850 5800 50  0001 L CNN
F 4 "Rectifier, Schottky, SMD, 3A, 40V, DO-214AC" H 6850 5700 50  0001 L CNN "Description"
F 5 "2.62" H 6850 5600 50  0001 L CNN "Height"
F 6 "Vishay" H 6850 5500 50  0001 L CNN "Manufacturer_Name"
F 7 "SS34" H 6850 5400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 6850 5300 50  0001 L CNN "Mouser Part Number"
F 9 "" H 6850 5200 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6850 5100 50  0001 L CNN "Arrow Part Number"
F 11 "" H 6850 5000 50  0001 L CNN "Arrow Price/Stock"
F 12 "C8678" H 6350 5750 50  0001 C CNN "LCSC"
	1    6350 5750
	1    0    0    -1  
$EndComp
$Comp
L SS34:SS34 D4
U 1 1 60845C50
P 7300 5750
F 0 "D4" H 7700 5483 50  0000 C CNN
F 1 "SS34" H 7700 5574 50  0000 C CNN
F 2 "quadimodo_imported_footprints:DIOM5026X262N" H 7800 5900 50  0001 L CNN
F 3 "https://www.vishay.com/docs/88751/ss32.pdf" H 7800 5800 50  0001 L CNN
F 4 "Rectifier, Schottky, SMD, 3A, 40V, DO-214AC" H 7800 5700 50  0001 L CNN "Description"
F 5 "2.62" H 7800 5600 50  0001 L CNN "Height"
F 6 "Vishay" H 7800 5500 50  0001 L CNN "Manufacturer_Name"
F 7 "SS34" H 7800 5400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 7800 5300 50  0001 L CNN "Mouser Part Number"
F 9 "" H 7800 5200 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 7800 5100 50  0001 L CNN "Arrow Part Number"
F 11 "" H 7800 5000 50  0001 L CNN "Arrow Price/Stock"
F 12 "C8678" H 7300 5750 50  0001 C CNN "LCSC"
	1    7300 5750
	1    0    0    -1  
$EndComp
$Comp
L SS34:SS34 D5
U 1 1 60846759
P 8400 5750
F 0 "D5" H 8800 5483 50  0000 C CNN
F 1 "SS34" H 8800 5574 50  0000 C CNN
F 2 "quadimodo_imported_footprints:DIOM5026X262N" H 8900 5900 50  0001 L CNN
F 3 "https://www.vishay.com/docs/88751/ss32.pdf" H 8900 5800 50  0001 L CNN
F 4 "Rectifier, Schottky, SMD, 3A, 40V, DO-214AC" H 8900 5700 50  0001 L CNN "Description"
F 5 "2.62" H 8900 5600 50  0001 L CNN "Height"
F 6 "Vishay" H 8900 5500 50  0001 L CNN "Manufacturer_Name"
F 7 "SS34" H 8900 5400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 8900 5300 50  0001 L CNN "Mouser Part Number"
F 9 "" H 8900 5200 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 8900 5100 50  0001 L CNN "Arrow Part Number"
F 11 "" H 8900 5000 50  0001 L CNN "Arrow Price/Stock"
F 12 "C8678" H 8400 5750 50  0001 C CNN "LCSC"
	1    8400 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 6000 5350 6000
Wire Wire Line
	5350 6000 5350 5750
Wire Wire Line
	5800 6000 5950 6000
Wire Wire Line
	5950 6000 5950 5750
Wire Wire Line
	5950 5750 5950 5350
Wire Wire Line
	5950 5350 5800 5350
Connection ~ 5950 5750
Connection ~ 5800 5350
Wire Wire Line
	5350 5750 5350 5350
Wire Wire Line
	5350 5350 5500 5350
Connection ~ 5350 5750
Connection ~ 5500 5350
Wire Wire Line
	6600 5350 6450 5350
Wire Wire Line
	6450 5350 6450 5750
Connection ~ 6600 5350
Wire Wire Line
	6450 5750 6450 6000
Wire Wire Line
	6450 6000 6600 6000
Connection ~ 6450 5750
Wire Wire Line
	6900 5350 7050 5350
Wire Wire Line
	7050 5350 7050 5750
Connection ~ 6900 5350
Wire Wire Line
	7050 5750 7050 6000
Wire Wire Line
	7050 6000 6900 6000
Connection ~ 7050 5750
Wire Wire Line
	7550 5350 7400 5350
Wire Wire Line
	7400 5350 7400 5750
Connection ~ 7550 5350
Wire Wire Line
	7400 5750 7400 6000
Wire Wire Line
	7400 6000 7550 6000
Connection ~ 7400 5750
Wire Wire Line
	7850 6000 8000 6000
Wire Wire Line
	8000 6000 8000 5750
Wire Wire Line
	8000 5750 8000 5350
Wire Wire Line
	8000 5350 7850 5350
Connection ~ 8000 5750
Connection ~ 7850 5350
Wire Wire Line
	8650 5350 8500 5350
Wire Wire Line
	8500 5350 8500 5750
Connection ~ 8650 5350
Wire Wire Line
	8500 5750 8500 6000
Wire Wire Line
	8500 6000 8650 6000
Connection ~ 8500 5750
Wire Wire Line
	8950 6000 9100 6000
Wire Wire Line
	9100 6000 9100 5750
Wire Wire Line
	9100 5750 9100 5350
Wire Wire Line
	9100 5350 8950 5350
Connection ~ 9100 5750
Connection ~ 8950 5350
Wire Wire Line
	3600 2450 3600 2900
$EndSCHEMATC