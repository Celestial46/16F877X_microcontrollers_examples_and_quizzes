
; PicBasic Pro Compiler 2.45a, (c) 1998, 2004 microEngineering Labs, Inc. All Rights Reserved.  
PM_USED			EQU	1

	INCLUDE	"16F877.INC"


; Define statements.
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00018	DEFINE  CODE_SIZE 8
#define		CODE_SIZE		 8

RAM_START       		EQU	00020h
RAM_END         		EQU	001EFh
RAM_BANKS       		EQU	00004h
BANK0_START     		EQU	00020h
BANK0_END       		EQU	0007Fh
BANK1_START     		EQU	000A0h
BANK1_END       		EQU	000EFh
BANK2_START     		EQU	00110h
BANK2_END       		EQU	0016Fh
BANK3_START     		EQU	00190h
BANK3_END       		EQU	001EFh
EEPROM_START    		EQU	02100h
EEPROM_END      		EQU	021FFh

; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00012	R0      VAR     WORD BANK0 SYSTEM       ' System Register
R0              		EQU	RAM_START + 000h
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00013	R1      VAR     WORD BANK0 SYSTEM       ' System Register
R1              		EQU	RAM_START + 002h
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00014	R2      VAR     WORD BANK0 SYSTEM       ' System Register
R2              		EQU	RAM_START + 004h
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00015	R3      VAR     WORD BANK0 SYSTEM       ' System Register
R3              		EQU	RAM_START + 006h
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00016	R4      VAR     WORD BANK0 SYSTEM       ' System Register
R4              		EQU	RAM_START + 008h
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00017	R5      VAR     WORD BANK0 SYSTEM       ' System Register
R5              		EQU	RAM_START + 00Ah
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00018	R6      VAR     WORD BANK0 SYSTEM       ' System Register
R6              		EQU	RAM_START + 00Ch
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00019	R7      VAR     WORD BANK0 SYSTEM       ' System Register
R7              		EQU	RAM_START + 00Eh
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00020	R8      VAR     WORD BANK0 SYSTEM       ' System Register
R8              		EQU	RAM_START + 010h
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00026	FLAGS   VAR     BYTE BANK0 SYSTEM       ' Static flags
FLAGS           		EQU	RAM_START + 012h
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00025	GOP     VAR     BYTE BANK0 SYSTEM       ' Gen Op Parameter
GOP             		EQU	RAM_START + 013h
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00022	RM1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Mask
RM1             		EQU	RAM_START + 014h
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00024	RM2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Mask
RM2             		EQU	RAM_START + 015h
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00021	RR1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Register
RR1             		EQU	RAM_START + 016h
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\PBPPIC14.RAM	00023	RR2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Register
RR2             		EQU	RAM_START + 017h
; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00035	i var byte 'for next i�in
_i               		EQU	RAM_START + 018h
; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00021	kay var byte
_kay             		EQU	RAM_START + 019h
; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00033	p var byte 'pause i�in
_p               		EQU	RAM_START + 01Ah
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00022	PORTL   VAR     PORTB
_PORTL           		EQU	 PORTB
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00023	PORTH   VAR     PORTC
_PORTH           		EQU	 PORTC
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00024	TRISL   VAR     TRISB
_TRISL           		EQU	 TRISB
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00025	TRISH   VAR     TRISC
_TRISH           		EQU	 TRISC

; Constants.
_T2400           		EQU	00000h
_T1200           		EQU	00001h
_T9600           		EQU	00002h
_T300            		EQU	00003h
_N2400           		EQU	00004h
_N1200           		EQU	00005h
_N9600           		EQU	00006h
_N300            		EQU	00007h
_OT2400          		EQU	00008h
_OT1200          		EQU	00009h
_OT9600          		EQU	0000Ah
_OT300           		EQU	0000Bh
_ON2400          		EQU	0000Ch
_ON1200          		EQU	0000Dh
_ON9600          		EQU	0000Eh
_ON300           		EQU	0000Fh
_MSBPRE          		EQU	00000h
_LSBPRE          		EQU	00001h
_MSBPOST         		EQU	00002h
_LSBPOST         		EQU	00003h
_LSBFIRST        		EQU	00000h
_MSBFIRST        		EQU	00001h
_CLS             		EQU	00000h
_HOME            		EQU	00001h
_BELL            		EQU	00007h
_BKSP            		EQU	00008h
_TAB             		EQU	00009h
_CR              		EQU	0000Dh
_UnitOn          		EQU	00012h
_UnitOff         		EQU	0001Ah
_UnitsOff        		EQU	0001Ch
_LightsOn        		EQU	00014h
_LightsOff       		EQU	00010h
_Dim             		EQU	0001Eh
_Bright          		EQU	00016h
	INCLUDE	"MATRIX~3.MAC"
	INCLUDE	"PBPPIC14.LIB"


; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00012	BANK0   $0020, $007F
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00013	BANK1   $00A0, $00EF
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00014	BANK2   $0110, $016F
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00015	BANK3   $0190, $01EF
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00016	EEPROM  $2100, $21FF
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00017	LIBRARY "PBPPIC14"
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00018	DEFINE  CODE_SIZE 8

; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00020	        include "PIC14EXT.BAS"

; F:\ISTEMP~1\MECANI~1\MCS\PBP245\16F877.BAS	00027	        include "PBPPIC14.RAM"

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00002	include "modedefs.bas"
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00014	Symbol T2400  = 0       ' Driven True
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00015	Symbol T1200  = 1       ' Driven True
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00016	Symbol T9600  = 2       ' Driven True
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00017	Symbol T300   = 3       ' Driven True
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00019	Symbol N2400  = 4       ' Driven Inverted
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00020	Symbol N1200  = 5       ' Driven Inverted
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00021	Symbol N9600  = 6       ' Driven Inverted
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00022	Symbol N300   = 7       ' Driven Inverted
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00024	Symbol OT2400 = 8       ' Open True
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00025	Symbol OT1200 = 9       ' Open True
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00026	Symbol OT9600 = 10      ' Open True
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00027	Symbol OT300  = 11      ' Open True
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00029	Symbol ON2400 = 12      ' Open Inverted
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00030	Symbol ON1200 = 13      ' Open Inverted
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00031	Symbol ON9600 = 14      ' Open Inverted
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00032	Symbol ON300  = 15      ' Open Inverted
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00036	Symbol MSBPRE = 0       ' MSB first, sample before clock
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00037	Symbol LSBPRE = 1       ' LSB first, sample before clock
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00038	Symbol MSBPOST = 2      ' MSB first, sample after clock
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00039	Symbol LSBPOST = 3      ' LSB first, sample after clock
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00042	Symbol LSBFIRST = 0     ' LSB first
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00043	Symbol MSBFIRST = 1     ' MSB first
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00047	Symbol CLS = 0
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00048	Symbol HOME = 1
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00049	Symbol BELL = 7
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00050	Symbol BKSP = 8
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00051	Symbol TAB = 9
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00052	Symbol CR = 13
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00056	Symbol UnitOn = %10010
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00057	Symbol UnitOff = %11010
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00058	Symbol UnitsOff = %11100
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00059	Symbol LightsOn = %10100
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00060	Symbol LightsOff = %10000
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00061	Symbol Dim = %11110
; F:\ISTEMP~1\MECANI~1\MCS\PBP245\MODEDEFS.BAS	00062	Symbol Bright = %10110

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00004	trisa=0
	MOVE?CB	000h, TRISA

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00005	trisb=0
	MOVE?CB	000h, TRISB

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00006	trisc=0
	MOVE?CB	000h, TRISC

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00007	trisd=0
	MOVE?CB	000h, TRISD

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00009	porta=255
	MOVE?CB	0FFh, PORTA

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00010	portb=255
	MOVE?CB	0FFh, PORTB

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00011	portc=255
	MOVE?CB	0FFh, PORTC

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00012	portd=255
	MOVE?CB	0FFh, PORTD

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00014	pause 100
	PAUSE?C	064h

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00022	kay=%00000001
	MOVE?CB	001h, _kay

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00034	p=1
	MOVE?CB	001h, _p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00036	i=0
	MOVE?CB	000h, _i

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00065	basla:

	LABEL?L	_basla	

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00067	kay=kay << 1
	SHIFTL?BCB	_kay, 001h, _kay

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00069	if kay=%10000000 then kay=%00000001
	CMPNE?BCL	_kay, 080h, L00001
	MOVE?CB	001h, _kay
	LABEL?L	L00001	

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00071	portb=kay
	MOVE?BB	_kay, PORTB

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00073	portc=%11111110
	MOVE?CB	0FEh, PORTC

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00074	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00075	portc=%11111101
	MOVE?CB	0FDh, PORTC

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00076	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00077	portc=%11111011
	MOVE?CB	0FBh, PORTC

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00078	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00079	portc=%11110111
	MOVE?CB	0F7h, PORTC

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00080	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00081	portc=%11101111
	MOVE?CB	0EFh, PORTC

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00082	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00083	portc=%11011111
	MOVE?CB	0DFh, PORTC

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00084	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00085	portc=%10111111
	MOVE?CB	0BFh, PORTC

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00086	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00087	portc=%01111111
	MOVE?CB	07Fh, PORTC

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00088	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00089	portc=%11111111
	MOVE?CB	0FFh, PORTC

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00090	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00092	portd=%11111110
	MOVE?CB	0FEh, PORTD

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00093	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00094	portd=%11111101
	MOVE?CB	0FDh, PORTD

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00095	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00096	portd=%11111011
	MOVE?CB	0FBh, PORTD

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00097	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00098	portd=%11110111
	MOVE?CB	0F7h, PORTD

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00099	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00100	portd=%11101111
	MOVE?CB	0EFh, PORTD

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00101	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00102	portd=%11011111
	MOVE?CB	0DFh, PORTD

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00103	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00104	portd=%10111111
	MOVE?CB	0BFh, PORTD

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00105	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00106	portd=%01111111
	MOVE?CB	07Fh, PORTD

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00107	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00108	portd=%11111111
	MOVE?CB	0FFh, PORTD

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00109	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00111	porta=%1110
	MOVE?CB	00Eh, PORTA

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00112	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00113	porta=%1101
	MOVE?CB	00Dh, PORTA

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00114	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00115	porta=%1011
	MOVE?CB	00Bh, PORTA

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00116	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00117	porta=%0111
	MOVE?CB	007h, PORTA

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00118	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00119	porta=%1111
	MOVE?CB	00Fh, PORTA

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00120	pause p
	PAUSE?B	_p

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00144	goto basla
	GOTO?L	_basla

; H:\20D�NE~1\MATRIX~1\MATRIX~3.PBP	00247	end
	END?	

	END
