//Deviec:FT60E21X
//-----------------------Variable---------------------------------
		_PA3		EQU		05H
		_PA4		EQU		05H
		_PAIF		EQU		0BH
		_T0IF		EQU		0BH
		_PAIE		EQU		0BH
		_T0IE		EQU		0BH
		_GIE		EQU		0BH
		_PS0		EQU		81H
		_PS1		EQU		81H
		_PS2		EQU		81H
		_PSA		EQU		81H
		_T0CS		EQU		81H
		_nPAPU		EQU		81H
		_TRISA3		EQU		85H
		_TRISA4		EQU		85H
		_WPUA4		EQU		95H
		_IOCA4		EQU		96H
		_rc.md		EQU		41H
		_rc.name		EQU		42H
		_rc.counter		EQU		43H
		_rc.current_state		EQU		45H
		_rc.syncH		EQU		47H
		_rc.syncL		EQU		48H
		_rc.data_H		EQU		49H
		_rc.data_L		EQU		4AH
		_rc.data_A		EQU		4BH
		_rc.data_B		EQU		4CH
		_rc.data_C		EQU		4DH
		_rc.current_data		EQU		4EH
		_rc.current_bit		EQU		50H
		_rc.fn		EQU		51H
		_rc		EQU		41H
		_a		EQU		7DH
		_b		EQU		7CH
		_c		EQU		40H
//		rc_update_time@rc.md		EQU		73H
//		rc_update_time@rc.name		EQU		74H
//		rc_update_time@rc.counter		EQU		75H
//		rc_update_time@rc.current_state		EQU		77H
//		rc_update_time@rc.syncH		EQU		79H
//		rc_update_time@rc.syncL		EQU		7AH
//		rc_update_time@rc.data_H		EQU		7BH
//		rc_update_time@rc.data_L		EQU		7CH
//		rc_update_time@rc.data_A		EQU		7DH
//		rc_update_time@rc.data_B		EQU		7EH
//		rc_update_time@rc.data_C		EQU		7FH
//		rc_update_time@rc.current_data		EQU		80H
//		rc_update_time@rc.current_bit		EQU		82H
//		rc_update_time@rc.fn		EQU		83H
//		rc_update_time@rc		EQU		73H
//		rc_update_time@rc		EQU		73H
//		rc_update_time@rc		EQU		73H
//		on_rc_receive@name		EQU		70H
//		rc_update_port@rc.md		EQU		77H
//		rc_update_port@rc.name		EQU		78H
//		rc_update_port@rc.counter		EQU		79H
//		rc_update_port@rc.current_state		EQU		7BH
//		rc_update_port@rc.syncH		EQU		7DH
//		rc_update_port@rc.syncL		EQU		7EH
//		rc_update_port@rc.data_H		EQU		7FH
//		rc_update_port@rc.data_L		EQU		80H
//		rc_update_port@rc.data_A		EQU		81H
//		rc_update_port@rc.data_B		EQU		82H
//		rc_update_port@rc.data_C		EQU		83H
//		rc_update_port@rc.current_data		EQU		84H
//		rc_update_port@rc.current_bit		EQU		86H
//		rc_update_port@rc.fn		EQU		87H
//		rc_update_port@rc		EQU		77H
//		rc_update_port@rc		EQU		77H
//		rc_update_port@logic		EQU		73H
//		rc_update_port@rc		EQU		77H
//		shift_bit@rc.md		EQU		72H
//		shift_bit@rc.name		EQU		73H
//		shift_bit@rc.counter		EQU		74H
//		shift_bit@rc.current_state		EQU		76H
//		shift_bit@rc.syncH		EQU		78H
//		shift_bit@rc.syncL		EQU		79H
//		shift_bit@rc.data_H		EQU		7AH
//		shift_bit@rc.data_L		EQU		7BH
//		shift_bit@rc.data_A		EQU		7CH
//		shift_bit@rc.data_B		EQU		7DH
//		shift_bit@rc.data_C		EQU		7EH
//		shift_bit@rc.current_data		EQU		7FH
//		shift_bit@rc.current_bit		EQU		81H
//		shift_bit@rc.fn		EQU		82H
//		shift_bit@rc		EQU		72H
//		shift_bit@rc		EQU		72H
//		shift_bit@bt		EQU		70H
//		shift_bit@rc		EQU		72H
//-----------------------Variable END---------------------------------

		LJUMP 	0FH 			//0000 	380F
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	78H 			//0006 	01F8
		LDR 	FSR,0 			//0007 	0804
		STR 	79H 			//0008 	01F9
		LDR 	PCLATH,0 		//0009 	080A
		STR 	7AH 			//000A 	01FA
		BCR 	STATUS,5 		//000B 	1283
		LDR 	7FH,0 			//000C 	087F
		STR 	7BH 			//000D 	01FB
		LJUMP 	209H 			//000E 	3A09
		LJUMP 	10H 			//000F 	3810
		LDWI 	40H 			//0010 	2A40
		CLRR 	7CH 			//0011 	017C
		CLRR 	7DH 			//0012 	017D
		BCR 	STATUS,7 		//0013 	1383
		STR 	FSR 			//0014 	0184
		LDWI 	52H 			//0015 	2A52
		LCALL 	263H 			//0016 	3263
		CLRR 	STATUS 			//0017 	0103
		LJUMP 	242H 			//0018 	3A42
		LJUMP 	19H 			//0019 	3819
		STR 	7FH 			//001A 	01FF
		LDWI 	0H 			//001B 	2A00
		STR 	PCLATH 			//001C 	018A
		LDR 	7FH,0 			//001D 	087F
		ADDWR 	PCL,1 			//001E 	0B82
		LJUMP 	1FH 			//001F 	381F
		LJUMP 	22AH 			//0020 	3A2A
		STR 	77H 			//0021 	01F7

		//;rcSW.c: 40: (*rc).counter = 0;
		ADDWI 	2H 			//0022 	2702
		STR 	FSR 			//0023 	0184
		BCR 	STATUS,7 		//0024 	1383
		CLRR 	INDF 			//0025 	0100
		INCR	FSR,1 			//0026 	0984
		CLRR 	INDF 			//0027 	0100

		//;rcSW.c: 41: if(logic != (*rc).current_state)
		LDR 	77H,0 			//0028 	0877
		ADDWI 	4H 			//0029 	2704
		LCALL 	101H 			//002A 	3101
		XORWR 	74H,0 			//002B 	0474
		BTSS 	STATUS,2 		//002C 	1D03
		LJUMP 	30H 			//002D 	3830
		LDR 	73H,0 			//002E 	0873
		XORWR 	75H,0 			//002F 	0475
		BTSC 	STATUS,2 		//0030 	1503
		RET		 					//0031 	0004

		//;rcSW.c: 42: {
		//;rcSW.c: 43: (*rc).current_state = logic;
		LDR 	77H,0 			//0032 	0877
		ADDWI 	4H 			//0033 	2704
		STR 	FSR 			//0034 	0184
		LDR 	73H,0 			//0035 	0873
		STR 	INDF 			//0036 	0180
		INCR	FSR,1 			//0037 	0984
		LDR 	74H,0 			//0038 	0874
		STR 	INDF 			//0039 	0180

		//;rcSW.c: 44: switch((*rc).md)
		LDR 	77H,0 			//003A 	0877
		STR 	FSR 			//003B 	0184
		LDR 	INDF,0 			//003C 	0800
		STR 	FSR 			//003D 	0184
		LDWI 	5H 			//003E 	2A05
		SUBWR 	FSR,0 			//003F 	0C04
		BTSC 	STATUS,0 		//0040 	1403
		RET		 					//0041 	0004
		LDWI 	2H 			//0042 	2A02
		STR 	PCLATH 			//0043 	018A
		LDWI 	6BH 			//0044 	2A6B
		ADDWR 	FSR,0 			//0045 	0B04
		STR 	PCL 			//0046 	0182
		RET		 					//0047 	0004

		//;rcSW.c: 47: (*rc).syncL = 0;
		LDR 	77H,0 			//0048 	0877
		ADDWI 	7H 			//0049 	2707
		STR 	FSR 			//004A 	0184
		CLRR 	INDF 			//004B 	0100

		//;rcSW.c: 48: (*rc).syncH = 0;
		LDR 	77H,0 			//004C 	0877
		ADDWI 	6H 			//004D 	2706
		STR 	FSR 			//004E 	0184
		CLRR 	INDF 			//004F 	0100

		//;rcSW.c: 49: (*rc).current_bit = 0;
		LDR 	77H,0 			//0050 	0877
		ADDWI 	FH 			//0051 	270F
		STR 	FSR 			//0052 	0184
		CLRR 	INDF 			//0053 	0100

		//;rcSW.c: 50: if( logic )
		LDR 	73H,0 			//0054 	0873
		IORWR 	74H,0 			//0055 	0374
		BTSC 	STATUS,2 		//0056 	1503
		RET		 					//0057 	0004

		//;rcSW.c: 51: {
		//;rcSW.c: 52: (*rc).md = syncHigh;
		LDR 	77H,0 			//0058 	0877
		STR 	FSR 			//0059 	0184
		CLRR 	INDF 			//005A 	0100
		INCR	INDF,1 			//005B 	0980

		//;rcSW.c: 53: }else{
		RET		 					//005C 	0004

		//;rcSW.c: 59: if( !logic )
		LDR 	73H,0 			//005D 	0873
		IORWR 	74H,0 			//005E 	0374
		BTSS 	STATUS,2 		//005F 	1D03
		LJUMP 	75H 			//0060 	3875

		//;rcSW.c: 60: {
		//;rcSW.c: 61: if( (*rc).syncH >= ( 1 * ( ( 350 - ( 350 * 70 / 100 ) ) / ( 20 * 5 ) ) ) )
		LDR 	77H,0 			//0061 	0877
		ADDWI 	6H 			//0062 	2706
		STR 	FSR 			//0063 	0184
		LDR 	INDF,0 			//0064 	0800
		BTSC 	STATUS,2 		//0065 	1503
		LJUMP 	75H 			//0066 	3875

		//;rcSW.c: 62: {
		//;rcSW.c: 63: if( (*rc).syncH < ( 1 * ( ( 350 + ( 350 * 70 / 100 ) ) / ( 20 * 5 ) + 2 ) )
		//+                           )
		LDR 	77H,0 			//0067 	0877
		ADDWI 	6H 			//0068 	2706
		STR 	FSR 			//0069 	0184
		LDWI 	7H 			//006A 	2A07
		SUBWR 	INDF,0 		//006B 	0C00

		//;rcSW.c: 64: {
		//;rcSW.c: 65: (*rc).md = syncLow;
		LDR 	77H,0 			//006C 	0877
		STR 	FSR 			//006D 	0184
		BTSC 	STATUS,0 		//006E 	1403
		LJUMP 	73H 			//006F 	3873
		LDWI 	2H 			//0070 	2A02
		STR 	INDF 			//0071 	0180

		//;rcSW.c: 66: }else{
		RET		 					//0072 	0004

		//;rcSW.c: 67: (*rc).md = SYNC;
		CLRR 	INDF 			//0073 	0100
		RET		 					//0074 	0004

		//;rcSW.c: 71: (*rc).md = SYNC;
		//;rcSW.c: 74: (*rc).md = SYNC;
		LJUMP 	108H 			//0075 	3908

		//;rcSW.c: 79: if( logic )
		LDR 	73H,0 			//0076 	0873
		IORWR 	74H,0 			//0077 	0374
		BTSC 	STATUS,2 		//0078 	1503
		LJUMP 	8EH 			//0079 	388E

		//;rcSW.c: 80: {
		//;rcSW.c: 81: if( ( (*rc).syncL > ( ( ( 350 - ( 350 * 70 / 100 ) ) / ( 20 * 5 ) ) * 31 )
		//+                          ) && ( (*rc).syncL < ( ( ( 350 + ( 350 * 70 / 100 ) ) / ( 20 * 5 ) + 2 ) * 31 ) ) )
		LDR 	77H,0 			//007A 	0877
		ADDWI 	7H 			//007B 	2707
		STR 	FSR 			//007C 	0184
		LDWI 	20H 			//007D 	2A20
		SUBWR 	INDF,0 		//007E 	0C00
		LDR 	77H,0 			//007F 	0877
		BTSS 	STATUS,0 		//0080 	1C03
		LJUMP 	8BH 			//0081 	388B
		ADDWI 	7H 			//0082 	2707
		STR 	FSR 			//0083 	0184
		LDWI 	D9H 			//0084 	2AD9
		SUBWR 	INDF,0 		//0085 	0C00

		//;rcSW.c: 82: {
		//;rcSW.c: 85: (*rc).data_H = 0;
		LDR 	77H,0 			//0086 	0877
		BTSC 	STATUS,0 		//0087 	1403
		LJUMP 	8BH 			//0088 	388B

		//;rcSW.c: 86: (*rc).md = dataH;
		LCALL 	EEH 			//0089 	30EE

		//;rcSW.c: 88: }else{
		RET		 					//008A 	0004

		//;rcSW.c: 89: (*rc).md = SYNC;
		STR 	FSR 			//008B 	0184
		CLRR 	INDF 			//008C 	0100
		RET		 					//008D 	0004

		//;rcSW.c: 92: (*rc).md = SYNC;
		LJUMP 	108H 			//008E 	3908

		//;rcSW.c: 98: if(!logic)
		LDR 	73H,0 			//008F 	0873
		IORWR 	74H,0 			//0090 	0374
		BTSS 	STATUS,2 		//0091 	1D03
		LJUMP 	B5H 			//0092 	38B5

		//;rcSW.c: 99: {
		//;rcSW.c: 101: if( ( (*rc).data_H > ( 1 * ( ( 350 - ( 350 * 70 / 100 ) ) / ( 20 * 5 ) ) )
		//+                           ) )
		LDR 	77H,0 			//0093 	0877
		ADDWI 	8H 			//0094 	2708

		//;rcSW.c: 102: {
		//;rcSW.c: 103: if( (*rc).data_H < ( 1 * ( ( 350 + ( 350 * 70 / 100 ) ) / ( 20 * 5 ) + 2 )
		//+                           ) )
		LCALL 	111H 			//0095 	3111
		BTSS 	STATUS,0 		//0096 	1C03
		LJUMP 	B2H 			//0097 	38B2
		ADDWI 	8H 			//0098 	2708

		//;rcSW.c: 104: {
		//;rcSW.c: 106: (*rc).data_L = 0;
		LCALL 	10CH 			//0099 	310C
		BTSC 	STATUS,0 		//009A 	1403
		LJUMP 	A1H 			//009B 	38A1

		//;rcSW.c: 107: (*rc).md = dataL;
		//;rcSW.c: 110: (*rc).current_data = 0;
		LCALL 	F6H 			//009C 	30F6
		CLRR 	INDF 			//009D 	0100
		INCR	FSR,1 			//009E 	0984
		CLRR 	INDF 			//009F 	0100

		//;rcSW.c: 112: }else if( (*rc).data_H <= ( (3 * ( ( 350 + ( 350 * 70 / 100 ) ) / ( 20 * 5
		//+                           ) + 2 )) ) )
		RET		 					//00A0 	0004
		ADDWI 	8H 			//00A1 	2708
		STR 	FSR 			//00A2 	0184
		LDWI 	16H 			//00A3 	2A16
		SUBWR 	INDF,0 		//00A4 	0C00

		//;rcSW.c: 113: {
		//;rcSW.c: 115: (*rc).data_L = 0;
		LDR 	77H,0 			//00A5 	0877
		BTSC 	STATUS,0 		//00A6 	1403
		LJUMP 	AFH 			//00A7 	38AF

		//;rcSW.c: 116: (*rc).md = dataL;
		//;rcSW.c: 119: (*rc).current_data = 1;
		LCALL 	F6H 			//00A8 	30F6
		LDWI 	1H 			//00A9 	2A01
		STR 	INDF 			//00AA 	0180
		LDWI 	0H 			//00AB 	2A00
		INCR	FSR,1 			//00AC 	0984
		CLRR 	INDF 			//00AD 	0100

		//;rcSW.c: 120: }else{
		RET		 					//00AE 	0004

		//;rcSW.c: 121: (*rc).md = SYNC;
		STR 	FSR 			//00AF 	0184
		CLRR 	INDF 			//00B0 	0100
		RET		 					//00B1 	0004

		//;rcSW.c: 124: (*rc).md = SYNC;
		STR 	FSR 			//00B2 	0184
		CLRR 	INDF 			//00B3 	0100
		RET		 					//00B4 	0004

		//;rcSW.c: 127: (*rc).md = SYNC;
		LJUMP 	108H 			//00B5 	3908

		//;rcSW.c: 134: if( logic )
		LDR 	73H,0 			//00B6 	0873
		IORWR 	74H,0 			//00B7 	0374
		BTSC 	STATUS,2 		//00B8 	1503
		LJUMP 	EDH 			//00B9 	38ED

		//;rcSW.c: 135: {
		//;rcSW.c: 136: if((*rc).current_data)
		LDR 	77H,0 			//00BA 	0877
		ADDWI 	DH 			//00BB 	270D
		LCALL 	101H 			//00BC 	3101
		IORWR 	75H,0 			//00BD 	0375
		BTSC 	STATUS,2 		//00BE 	1503
		LJUMP 	D4H 			//00BF 	38D4

		//;rcSW.c: 137: {
		//;rcSW.c: 139: if( (*rc).data_L < (1 * ( ( 350 + ( 350 * 70 / 100 ) ) / ( 20 * 5 ) + 2 ))
		//+                           )
		LDR 	77H,0 			//00C0 	0877
		ADDWI 	9H 			//00C1 	2709

		//;rcSW.c: 140: {
		//;rcSW.c: 141: if( (*rc).data_L > (1 * ( ( 350 - ( 350 * 70 / 100 ) ) / ( 20 * 5 ) )) )
		LCALL 	10CH 			//00C2 	310C
		BTSC 	STATUS,0 		//00C3 	1403
		LJUMP 	D1H 			//00C4 	38D1
		ADDWI 	9H 			//00C5 	2709

		//;rcSW.c: 142: {
		//;rcSW.c: 143: (*rc).data_H = 0;
		LCALL 	111H 			//00C6 	3111
		BTSS 	STATUS,0 		//00C7 	1C03
		LJUMP 	CEH 			//00C8 	38CE

		//;rcSW.c: 144: (*rc).md = dataH;
		LCALL 	EEH 			//00C9 	30EE

		//;rcSW.c: 145: shift_bit(rc,1);
		CLRR 	70H 			//00CA 	0170
		INCR	70H,1 			//00CB 	09F0
		LDR 	77H,0 			//00CC 	0877
		LJUMP 	1CEH 			//00CD 	39CE

		//;rcSW.c: 148: (*rc).md = SYNC;
		//;rcSW.c: 146: }else{
		STR 	FSR 			//00CE 	0184
		CLRR 	INDF 			//00CF 	0100
		RET		 					//00D0 	0004

		//;rcSW.c: 152: (*rc).md = SYNC;
		STR 	FSR 			//00D1 	0184
		CLRR 	INDF 			//00D2 	0100
		RET		 					//00D3 	0004

		//;rcSW.c: 156: if( (*rc).data_L < (3 * ( ( 350 + ( 350 * 70 / 100 ) ) / ( 20 * 5 ) + 2 ))
		//+                           )
		LDR 	77H,0 			//00D4 	0877
		ADDWI 	9H 			//00D5 	2709
		STR 	FSR 			//00D6 	0184
		LDWI 	15H 			//00D7 	2A15
		SUBWR 	INDF,0 		//00D8 	0C00

		//;rcSW.c: 157: {
		//;rcSW.c: 158: if( (*rc).data_L > (3 * ( ( 350 - ( 350 * 70 / 100 ) ) / ( 20 * 5 ) )) )
		LDR 	77H,0 			//00D9 	0877
		BTSC 	STATUS,0 		//00DA 	1403
		LJUMP 	EAH 			//00DB 	38EA
		ADDWI 	9H 			//00DC 	2709
		STR 	FSR 			//00DD 	0184
		LDWI 	4H 			//00DE 	2A04
		SUBWR 	INDF,0 		//00DF 	0C00

		//;rcSW.c: 159: {
		//;rcSW.c: 160: (*rc).data_H = 0;
		LDR 	77H,0 			//00E0 	0877
		BTSS 	STATUS,0 		//00E1 	1C03
		LJUMP 	E7H 			//00E2 	38E7

		//;rcSW.c: 161: (*rc).md = dataH;
		LCALL 	EEH 			//00E3 	30EE

		//;rcSW.c: 162: shift_bit(rc,0);
		CLRR 	70H 			//00E4 	0170
		LDR 	77H,0 			//00E5 	0877
		LJUMP 	1CEH 			//00E6 	39CE

		//;rcSW.c: 165: (*rc).md = SYNC;
		//;rcSW.c: 163: }else{
		STR 	FSR 			//00E7 	0184
		CLRR 	INDF 			//00E8 	0100
		RET		 					//00E9 	0004

		//;rcSW.c: 169: (*rc).md = SYNC;
		STR 	FSR 			//00EA 	0184
		CLRR 	INDF 			//00EB 	0100
		RET		 					//00EC 	0004

		//;rcSW.c: 175: (*rc).md = SYNC;
		LJUMP 	108H 			//00ED 	3908
		ADDWI 	8H 			//00EE 	2708
		STR 	FSR 			//00EF 	0184
		CLRR 	INDF 			//00F0 	0100
		LDR 	77H,0 			//00F1 	0877
		STR 	FSR 			//00F2 	0184
		LDWI 	4H 			//00F3 	2A04
		STR 	INDF 			//00F4 	0180
		RET		 					//00F5 	0004
		ADDWI 	9H 			//00F6 	2709
		STR 	FSR 			//00F7 	0184
		CLRR 	INDF 			//00F8 	0100
		LDR 	77H,0 			//00F9 	0877
		STR 	FSR 			//00FA 	0184
		LDWI 	3H 			//00FB 	2A03
		STR 	INDF 			//00FC 	0180
		LDR 	77H,0 			//00FD 	0877
		ADDWI 	DH 			//00FE 	270D
		STR 	FSR 			//00FF 	0184
		RET		 					//0100 	0004
		STR 	FSR 			//0101 	0184
		LDR 	INDF,0 			//0102 	0800
		STR 	75H 			//0103 	01F5
		INCR	FSR,1 			//0104 	0984
		LDR 	INDF,0 			//0105 	0800
		STR 	76H 			//0106 	01F6
		RET		 					//0107 	0004
		LDR 	77H,0 			//0108 	0877
		STR 	FSR 			//0109 	0184
		CLRR 	INDF 			//010A 	0100
		RET		 					//010B 	0004
		STR 	FSR 			//010C 	0184
		LDWI 	7H 			//010D 	2A07
		SUBWR 	INDF,0 		//010E 	0C00
		LDR 	77H,0 			//010F 	0877
		RET		 					//0110 	0004
		STR 	FSR 			//0111 	0184
		LDWI 	2H 			//0112 	2A02
		SUBWR 	INDF,0 		//0113 	0C00
		LDR 	77H,0 			//0114 	0877
		RET		 					//0115 	0004
		STR 	73H 			//0116 	01F3

		//;rcSW.c: 187: (*rc).counter++;
		ADDWI 	2H 			//0117 	2702
		STR 	FSR 			//0118 	0184
		LDWI 	1H 			//0119 	2A01
		BCR 	STATUS,7 		//011A 	1383
		ADDWR 	INDF,1 		//011B 	0B80
		INCR	FSR,1 			//011C 	0984
		BTSC 	STATUS,0 		//011D 	1403
		INCR	INDF,1 			//011E 	0980

		//;rcSW.c: 189: if((*rc).counter == 5)
		LDR 	73H,0 			//011F 	0873
		ADDWI 	2H 			//0120 	2702
		STR 	FSR 			//0121 	0184
		LDR 	INDF,0 			//0122 	0800
		STR 	71H 			//0123 	01F1
		INCR	FSR,1 			//0124 	0984
		LDR 	INDF,0 			//0125 	0800
		STR 	72H 			//0126 	01F2
		LDWI 	5H 			//0127 	2A05
		XORWR 	71H,0 			//0128 	0471
		IORWR 	72H,0 			//0129 	0372
		BTSS 	STATUS,2 		//012A 	1D03
		RET		 					//012B 	0004

		//;rcSW.c: 190: {
		//;rcSW.c: 191: (*rc).counter = 0;
		LCALL 	1BDH 			//012C 	31BD

		//;rcSW.c: 193: switch((*rc).md)
		LJUMP 	19BH 			//012D 	399B

		//;rcSW.c: 196: (*rc).syncL++;
		LDR 	73H,0 			//012E 	0873
		ADDWI 	7H 			//012F 	2707
		STR 	FSR 			//0130 	0184
		INCR	INDF,1 			//0131 	0980

		//;rcSW.c: 197: if((*rc).syncL > 230)
		LDR 	73H,0 			//0132 	0873
		ADDWI 	7H 			//0133 	2707
		STR 	FSR 			//0134 	0184
		LDWI 	E7H 			//0135 	2AE7
		SUBWR 	INDF,0 		//0136 	0C00
		BTSS 	STATUS,0 		//0137 	1C03
		RET		 					//0138 	0004

		//;rcSW.c: 198: {
		//;rcSW.c: 199: (*rc).md = SYNC;
		LJUMP 	1CAH 			//0139 	39CA

		//;rcSW.c: 204: (*rc).syncH++;
		LDR 	73H,0 			//013A 	0873
		ADDWI 	6H 			//013B 	2706
		STR 	FSR 			//013C 	0184
		INCR	INDF,1 			//013D 	0980

		//;rcSW.c: 205: if((*rc).syncH > 20)
		LDR 	73H,0 			//013E 	0873
		ADDWI 	6H 			//013F 	2706
		STR 	FSR 			//0140 	0184
		LDWI 	15H 			//0141 	2A15
		SUBWR 	INDF,0 		//0142 	0C00
		BTSS 	STATUS,0 		//0143 	1C03
		RET		 					//0144 	0004

		//;rcSW.c: 206: {
		//;rcSW.c: 207: (*rc).md = SYNC;
		LJUMP 	1CAH 			//0145 	39CA

		//;rcSW.c: 213: (*rc).data_H++;
		LDR 	73H,0 			//0146 	0873
		ADDWI 	8H 			//0147 	2708
		STR 	FSR 			//0148 	0184
		INCR	INDF,1 			//0149 	0980

		//;rcSW.c: 214: if((*rc).data_H > 20)
		LDR 	73H,0 			//014A 	0873
		ADDWI 	8H 			//014B 	2708
		STR 	FSR 			//014C 	0184
		LDWI 	15H 			//014D 	2A15
		SUBWR 	INDF,0 		//014E 	0C00
		BTSS 	STATUS,0 		//014F 	1C03
		RET		 					//0150 	0004

		//;rcSW.c: 215: {
		//;rcSW.c: 216: (*rc).data_H = 0;
		LDR 	73H,0 			//0151 	0873
		ADDWI 	8H 			//0152 	2708

		//;rcSW.c: 217: (*rc).md = SYNC;
		LCALL 	1C4H 			//0153 	31C4
		RET		 					//0154 	0004

		//;rcSW.c: 224: (*rc).data_L++;
		LDR 	73H,0 			//0155 	0873
		ADDWI 	9H 			//0156 	2709
		STR 	FSR 			//0157 	0184
		INCR	INDF,1 			//0158 	0980

		//;rcSW.c: 225: if((*rc).data_L > 20)
		LDR 	73H,0 			//0159 	0873
		ADDWI 	9H 			//015A 	2709
		STR 	FSR 			//015B 	0184
		LDWI 	15H 			//015C 	2A15
		SUBWR 	INDF,0 		//015D 	0C00
		BTSS 	STATUS,0 		//015E 	1C03
		RET		 					//015F 	0004

		//;rcSW.c: 226: {
		//;rcSW.c: 227: if( (*rc).data_H < ( ( 350 + ( 350 * 70 / 100 ) ) / ( 20 * 5 ) + 2 ) )
		LDR 	73H,0 			//0160 	0873
		ADDWI 	8H 			//0161 	2708
		STR 	FSR 			//0162 	0184
		LDWI 	7H 			//0163 	2A07
		SUBWR 	INDF,0 		//0164 	0C00
		BTSC 	STATUS,0 		//0165 	1403
		LJUMP 	18FH 			//0166 	398F

		//;rcSW.c: 228: {
		//;rcSW.c: 231: (*rc).current_state = 0;
		LDR 	73H,0 			//0167 	0873
		ADDWI 	4H 			//0168 	2704
		STR 	FSR 			//0169 	0184
		CLRR 	INDF 			//016A 	0100
		INCR	FSR,1 			//016B 	0984
		CLRR 	INDF 			//016C 	0100

		//;rcSW.c: 232: (*rc).current_bit = 0;
		LDR 	73H,0 			//016D 	0873
		ADDWI 	FH 			//016E 	270F
		STR 	FSR 			//016F 	0184
		CLRR 	INDF 			//0170 	0100

		//;rcSW.c: 233: (*rc).counter = 0;
		LCALL 	1BDH 			//0171 	31BD

		//;rcSW.c: 234: (*rc).syncL = (*rc).data_L;
		LDR 	73H,0 			//0172 	0873
		ADDWI 	9H 			//0173 	2709
		STR 	FSR 			//0174 	0184
		LDR 	INDF,0 			//0175 	0800
		STR 	71H 			//0176 	01F1
		LDR 	73H,0 			//0177 	0873
		ADDWI 	7H 			//0178 	2707
		STR 	FSR 			//0179 	0184
		LDR 	71H,0 			//017A 	0871
		STR 	INDF 			//017B 	0180

		//;rcSW.c: 235: (*rc).syncH = (*rc).data_H;
		LDR 	73H,0 			//017C 	0873
		ADDWI 	8H 			//017D 	2708
		STR 	FSR 			//017E 	0184
		LDR 	INDF,0 			//017F 	0800
		STR 	71H 			//0180 	01F1
		LDR 	73H,0 			//0181 	0873
		ADDWI 	6H 			//0182 	2706
		STR 	FSR 			//0183 	0184
		LDR 	71H,0 			//0184 	0871
		STR 	INDF 			//0185 	0180

		//;rcSW.c: 236: (*rc).md = syncLow;
		LDR 	73H,0 			//0186 	0873
		STR 	FSR 			//0187 	0184
		LDWI 	2H 			//0188 	2A02
		STR 	INDF 			//0189 	0180

		//;rcSW.c: 237: (*rc).data_L = 0;
		LDR 	73H,0 			//018A 	0873

		//;rcSW.c: 238: (*rc).data_H = 0;
		LCALL 	1B5H 			//018B 	31B5

		//;rcSW.c: 239: (*rc).fn((*rc).name);
		LCALL 	1ACH 			//018C 	31AC
		LCALL 	1AH 			//018D 	301A

		//;rcSW.c: 240: }else{
		RET		 					//018E 	0004

		//;rcSW.c: 242: (*rc).fn((*rc).name);
		LCALL 	1ACH 			//018F 	31AC
		LCALL 	1AH 			//0190 	301A

		//;rcSW.c: 243: (*rc).syncL = 0;
		LDR 	73H,0 			//0191 	0873
		ADDWI 	7H 			//0192 	2707
		STR 	FSR 			//0193 	0184
		CLRR 	INDF 			//0194 	0100

		//;rcSW.c: 244: (*rc).syncH = 0;
		LDR 	73H,0 			//0195 	0873
		ADDWI 	6H 			//0196 	2706

		//;rcSW.c: 245: (*rc).md = SYNC;
		LCALL 	1C4H 			//0197 	31C4

		//;rcSW.c: 246: (*rc).data_L = 0;
		LDR 	73H,0 			//0198 	0873

		//;rcSW.c: 247: (*rc).data_H = 0;
		LCALL 	1B5H 			//0199 	31B5
		RET		 					//019A 	0004
		LDR 	73H,0 			//019B 	0873
		STR 	FSR 			//019C 	0184
		LDR 	INDF,0 			//019D 	0800
		XORWI 	1H 			//019E 	2601
		BTSC 	STATUS,2 		//019F 	1503
		LJUMP 	13AH 			//01A0 	393A
		XORWI 	3H 			//01A1 	2603
		BTSC 	STATUS,2 		//01A2 	1503
		LJUMP 	12EH 			//01A3 	392E
		XORWI 	1H 			//01A4 	2601
		BTSC 	STATUS,2 		//01A5 	1503
		LJUMP 	155H 			//01A6 	3955
		XORWI 	7H 			//01A7 	2607
		BTSC 	STATUS,2 		//01A8 	1503
		LJUMP 	146H 			//01A9 	3946
		LJUMP 	1ABH 			//01AA 	39AB
		RET		 					//01AB 	0004
		INCR	73H,0 			//01AC 	0973
		STR 	FSR 			//01AD 	0184
		LDR 	INDF,0 			//01AE 	0800
		STR 	70H 			//01AF 	01F0
		LDR 	73H,0 			//01B0 	0873
		ADDWI 	10H 			//01B1 	2710
		STR 	FSR 			//01B2 	0184
		LDR 	INDF,0 			//01B3 	0800
		RET		 					//01B4 	0004
		ADDWI 	9H 			//01B5 	2709
		STR 	FSR 			//01B6 	0184
		CLRR 	INDF 			//01B7 	0100
		LDR 	73H,0 			//01B8 	0873
		ADDWI 	8H 			//01B9 	2708
		STR 	FSR 			//01BA 	0184
		CLRR 	INDF 			//01BB 	0100
		RET		 					//01BC 	0004
		LDR 	73H,0 			//01BD 	0873
		ADDWI 	2H 			//01BE 	2702
		STR 	FSR 			//01BF 	0184
		CLRR 	INDF 			//01C0 	0100
		INCR	FSR,1 			//01C1 	0984
		CLRR 	INDF 			//01C2 	0100
		RET		 					//01C3 	0004
		STR 	FSR 			//01C4 	0184
		CLRR 	INDF 			//01C5 	0100
		LDR 	73H,0 			//01C6 	0873
		STR 	FSR 			//01C7 	0184
		CLRR 	INDF 			//01C8 	0100
		RET		 					//01C9 	0004
		LDR 	73H,0 			//01CA 	0873
		STR 	FSR 			//01CB 	0184
		CLRR 	INDF 			//01CC 	0100
		RET		 					//01CD 	0004
		STR 	72H 			//01CE 	01F2

		//;rcSW.c: 262: if ((*rc).current_bit < 8)
		ADDWI 	FH 			//01CF 	270F
		STR 	FSR 			//01D0 	0184
		LDWI 	8H 			//01D1 	2A08
		SUBWR 	INDF,0 		//01D2 	0C00

		//;rcSW.c: 263: {
		//;rcSW.c: 264: (*rc).data_A = ((*rc).data_A << 1) | bt;
		LDR 	72H,0 			//01D3 	0872
		BTSC 	STATUS,0 		//01D4 	1403
		LJUMP 	1DAH 			//01D5 	39DA
		ADDWI 	AH 			//01D6 	270A
		LCALL 	202H 			//01D7 	3202
		ADDWI 	AH 			//01D8 	270A
		LJUMP 	1EFH 			//01D9 	39EF

		//;rcSW.c: 265: } else if ((*rc).current_bit < 16)
		ADDWI 	FH 			//01DA 	270F
		STR 	FSR 			//01DB 	0184
		LDWI 	10H 			//01DC 	2A10
		SUBWR 	INDF,0 		//01DD 	0C00

		//;rcSW.c: 266: {
		//;rcSW.c: 267: (*rc).data_B = ((*rc).data_B << 1) | bt;
		LDR 	72H,0 			//01DE 	0872
		BTSC 	STATUS,0 		//01DF 	1403
		LJUMP 	1E5H 			//01E0 	39E5
		ADDWI 	BH 			//01E1 	270B
		LCALL 	202H 			//01E2 	3202
		ADDWI 	BH 			//01E3 	270B
		LJUMP 	1EFH 			//01E4 	39EF

		//;rcSW.c: 268: } else if ((*rc).current_bit < 24)
		ADDWI 	FH 			//01E5 	270F
		STR 	FSR 			//01E6 	0184
		LDWI 	18H 			//01E7 	2A18
		SUBWR 	INDF,0 		//01E8 	0C00

		//;rcSW.c: 269: {
		//;rcSW.c: 270: (*rc).data_C = ((*rc).data_C << 1) | bt;
		LDR 	72H,0 			//01E9 	0872
		BTSC 	STATUS,0 		//01EA 	1403
		LJUMP 	1F3H 			//01EB 	39F3
		ADDWI 	CH 			//01EC 	270C
		LCALL 	202H 			//01ED 	3202
		ADDWI 	CH 			//01EE 	270C
		STR 	FSR 			//01EF 	0184
		LDR 	71H,0 			//01F0 	0871
		STR 	INDF 			//01F1 	0180

		//;rcSW.c: 271: }
		//;rcSW.c: 273: (*rc).current_bit++;
		LDR 	72H,0 			//01F2 	0872
		ADDWI 	FH 			//01F3 	270F
		STR 	FSR 			//01F4 	0184
		INCR	INDF,1 			//01F5 	0980

		//;rcSW.c: 275: if ((*rc).current_bit >= 24) {
		LDR 	72H,0 			//01F6 	0872
		ADDWI 	FH 			//01F7 	270F
		STR 	FSR 			//01F8 	0184
		LDWI 	18H 			//01F9 	2A18
		SUBWR 	INDF,0 		//01FA 	0C00
		BTSS 	STATUS,0 		//01FB 	1C03
		RET		 					//01FC 	0004

		//;rcSW.c: 276: (*rc).current_bit = 0;
		LDR 	72H,0 			//01FD 	0872
		ADDWI 	FH 			//01FE 	270F
		STR 	FSR 			//01FF 	0184
		CLRR 	INDF 			//0200 	0100
		RET		 					//0201 	0004
		STR 	FSR 			//0202 	0184
		BCR 	STATUS,0 		//0203 	1003
		RLR 	INDF,0 			//0204 	0500
		IORWR 	70H,0 			//0205 	0370
		STR 	71H 			//0206 	01F1
		LDR 	72H,0 			//0207 	0872
		RET		 					//0208 	0004

		//;remote_receiver.C: 68: if(PAIE && PAIF)
		BTSC 	INTCON,3 		//0209 	158B
		BTSS 	INTCON,0 		//020A 	1C0B
		LJUMP 	217H 			//020B 	3A17

		//;remote_receiver.C: 69: {
		//;remote_receiver.C: 70: PAIF = 0;
		BCR 	INTCON,0 		//020C 	100B

		//;remote_receiver.C: 71: rc_update_port(&rc,PA4);
		BCR 	STATUS,0 		//020D 	1003
		BTSC 	5H,4 			//020E 	1605
		BSR 	STATUS,0 		//020F 	1803
		LDWI 	0H 			//0210 	2A00
		BTSC 	STATUS,0 		//0211 	1403
		LDWI 	1H 			//0212 	2A01
		STR 	73H 			//0213 	01F3
		LDWI 	41H 			//0214 	2A41
		CLRR 	74H 			//0215 	0174
		LCALL 	21H 			//0216 	3021

		//;remote_receiver.C: 72: }
		//;remote_receiver.C: 74: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0217 	168B
		BTSS 	INTCON,2 		//0218 	1D0B
		LJUMP 	21FH 			//0219 	3A1F

		//;remote_receiver.C: 75: {
		//;remote_receiver.C: 76: T0IF = 0;
		BCR 	INTCON,2 		//021A 	110B

		//;remote_receiver.C: 77: TMR0 = 236;
		LDWI 	ECH 			//021B 	2AEC
		STR 	1H 			//021C 	0181

		//;remote_receiver.C: 79: rc_update_time(&rc);
		LDWI 	41H 			//021D 	2A41
		LCALL 	116H 			//021E 	3116
		LDR 	7BH,0 			//021F 	087B
		STR 	7FH 			//0220 	01FF
		LDR 	7AH,0 			//0221 	087A
		STR 	PCLATH 			//0222 	018A
		LDR 	79H,0 			//0223 	0879
		STR 	FSR 			//0224 	0184
		SWAPR 	78H,0 			//0225 	0778
		STR 	STATUS 			//0226 	0183
		SWAPR 	7EH,1 			//0227 	07FE
		SWAPR 	7EH,0 			//0228 	077E
		RETI		 			//0229 	0009

		//;remote_receiver.C: 85: a = rc.data_A;
		LDR 	4BH,0 			//022A 	084B
		STR 	7DH 			//022B 	01FD

		//;remote_receiver.C: 86: b = rc.data_B;
		LDR 	4CH,0 			//022C 	084C
		STR 	7CH 			//022D 	01FC

		//;remote_receiver.C: 87: c = rc.data_C;
		LDR 	4DH,0 			//022E 	084D
		STR 	40H 			//022F 	01C0

		//;remote_receiver.C: 95: if(rc.data_A == 0b00101111 && rc.data_B == 0b01111111 && rc.data
		//+                          _C == 0b10110001 )
		LDWI 	2FH 			//0230 	2A2F
		XORWR 	4BH,0 			//0231 	044B
		BTSS 	STATUS,2 		//0232 	1D03
		RET		 					//0233 	0004
		LDWI 	7FH 			//0234 	2A7F
		XORWR 	4CH,0 			//0235 	044C
		BTSS 	STATUS,2 		//0236 	1D03
		RET		 					//0237 	0004
		LDWI 	B1H 			//0238 	2AB1
		XORWR 	4DH,0 			//0239 	044D
		BTSS 	STATUS,2 		//023A 	1D03
		RET		 					//023B 	0004

		//;remote_receiver.C: 96: {
		//;remote_receiver.C: 98: PA3 = !PA3;
		LDWI 	8H 			//023C 	2A08
		XORWR 	5H,1 			//023D 	0485

		//;remote_receiver.C: 99: rc.data_A = 0;
		CLRR 	4BH 			//023E 	014B

		//;remote_receiver.C: 100: rc.data_B = 0;
		CLRR 	4CH 			//023F 	014C

		//;remote_receiver.C: 101: rc.data_C = 0;
		CLRR 	4DH 			//0240 	014D
		RET		 					//0241 	0004

		//;remote_receiver.C: 107: OSCCON = 0B01110000;
		LDWI 	70H 			//0242 	2A70
		BSR 	STATUS,5 		//0243 	1A83
		STR 	FH 			//0244 	018F

		//;remote_receiver.C: 109: TRISA3 = 0;
		BCR 	5H,3 			//0245 	1185

		//;remote_receiver.C: 110: PA3 = 0;
		BCR 	STATUS,5 		//0246 	1283
		BCR 	5H,3 			//0247 	1185

		//;remote_receiver.C: 112: rc.fn = &on_rc_receive;
		LDWI 	1H 			//0248 	2A01
		STR 	51H 			//0249 	01D1

		//;remote_receiver.C: 114: PA4_Level_Change_INITIAL();
		LCALL 	25AH 			//024A 	325A

		//;remote_receiver.C: 116: t0_init();
		LCALL 	24FH 			//024B 	324F

		//;remote_receiver.C: 118: GIE = 1;
		BSR 	INTCON,7 		//024C 	1B8B

		//;remote_receiver.C: 121: {
		//;remote_receiver.C: 122: __nop();
		NOP		 					//024D 	0000
		LJUMP 	24DH 			//024E 	3A4D

		//;remote_receiver.C: 53: T0CS = 0;
		BCR 	1H,5 			//024F 	1281

		//;remote_receiver.C: 54: PSA = 0;
		BCR 	1H,3 			//0250 	1181

		//;remote_receiver.C: 55: PS0 = 0;
		BCR 	1H,0 			//0251 	1001

		//;remote_receiver.C: 56: PS1 = 0;
		BCR 	1H,1 			//0252 	1081

		//;remote_receiver.C: 57: PS2 = 0;
		BCR 	1H,2 			//0253 	1101

		//;remote_receiver.C: 59: T0IE = 1;
		BSR 	INTCON,5 		//0254 	1A8B

		//;remote_receiver.C: 60: T0IF = 0;
		BCR 	INTCON,2 		//0255 	110B

		//;remote_receiver.C: 62: TMR0 = 236;
		LDWI 	ECH 			//0256 	2AEC
		BCR 	STATUS,5 		//0257 	1283
		STR 	1H 			//0258 	0181
		RET		 					//0259 	0004

		//;remote_receiver.C: 42: TRISA4 = 1;
		BSR 	STATUS,5 		//025A 	1A83
		BSR 	5H,4 			//025B 	1A05

		//;remote_receiver.C: 43: PAIF = 0;
		BCR 	INTCON,0 		//025C 	100B

		//;remote_receiver.C: 44: IOCA4 = 1;
		BSR 	16H,4 			//025D 	1A16

		//;remote_receiver.C: 45: WPUA4 = 1;
		BSR 	15H,4 			//025E 	1A15

		//;remote_receiver.C: 46: nPAPU = 0;
		BCR 	1H,7 			//025F 	1381

		//;remote_receiver.C: 47: PAIE = 1;
		BSR 	INTCON,3 		//0260 	198B

		//;remote_receiver.C: 48: PAIF = 0;
		BCR 	INTCON,0 		//0261 	100B
		RET		 					//0262 	0004
		CLRWDT	 			//0263 	0001
		CLRR 	INDF 			//0264 	0100
		INCR	FSR,1 			//0265 	0984
		XORWR 	FSR,0 			//0266 	0404
		BTSC 	STATUS,2 		//0267 	1503
		RETW 	0H 			//0268 	2100
		XORWR 	FSR,0 			//0269 	0404
		LJUMP 	264H 			//026A 	3A64
		LJUMP 	48H 			//026B 	3848
		LJUMP 	5DH 			//026C 	385D
		LJUMP 	76H 			//026D 	3876
		LJUMP 	B6H 			//026E 	38B6
		LJUMP 	8FH 			//026F 	388F
			END
