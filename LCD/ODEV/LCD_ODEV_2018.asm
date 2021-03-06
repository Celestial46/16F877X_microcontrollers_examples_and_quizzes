#INCLUDE <P16F877A.INC>
__CONFIG H'3F31'
SAYAC EQU 0X20	 	 ;TMR1 DE���KEN� (10 VER�CEZ.YAN� 50.000*10=500.000=0.5 SN)
SAYAC0 EQU 0X21		 ;GECIKME DE���KEN�
SAYAC1 EQU 0X22		 ;GEC�KME DE���KEN�
LCD_DATA EQU 0X23	 ;LCD VER�-KOMUT ALIRTKEN KULLANILAN DE���KEN 	
BIR1 EQU 0X24
ON1 EQU 0X25
YUZ1 EQU 0X26
BIR2 EQU 0X27
ON2 EQU 0X28
YUZ2 EQU 0X29
SAYI EQU 0X30
SAYITMP EQU 0X31
	ORG 0X00
	GOTO MAIN
	ORG 0X04
KESME
	BANKSEL PIR1
	BCF PIR1,TMR1IF
	BANKSEL TMR1H
	MOVLW H'3C'
	MOVWF TMR1H
	MOVLW H'B0'
	MOVWF TMR1L
	DECFSZ SAYAC,F
	RETFIE
	MOVLW D'10'
	MOVWF SAYAC
KONTROL_SATIR1
	INCF BIR1,F
	MOVFW BIR1
	SUBLW D'10'
	BTFSS STATUS,Z
	RETFIE
	CLRF BIR1
	INCF ON1,F
	MOVFW ON1
	SUBLW D'10'
	BTFSS STATUS,Z
	RETFIE
	CLRF ON1
	INCF YUZ1,F
	MOVFW YUZ1
	SUBLW D'2'
	BTFSS STATUS,Z
	RETFIE
	CLRF YUZ1
	RETFIE
MAIN
	BANKSEL ADCON1
	MOVLW D'6'
	MOVWF ADCON1
	BANKSEL TRISA
	CLRF TRISD
	BSF TRISA,0
	BSF TRISA,1
	CLRF PORTB
	BANKSEL PORTA
	CLRF PORTA
	CLRF PORTD
	CLRF PORTB
	BCF PORTB,5
	BANKSEL INTCON
	BSF INTCON,GIE
	BSF INTCON,PEIE
	BANKSEL T1CON
	BSF T1CON,0
	BANKSEL TMR1H
	MOVLW H'3C'
	MOVWF TMR1H
	MOVLW H'B0'
	MOVWF TMR1L
	BANKSEL PIE1
	BSF PIE1,TMR1IE
	BANKSEL PIR1
	BCF PIR1,TMR1IF	
	MOVLW D'10'
	MOVWF SAYAC
	MOVLW D'100'
	MOVWF SAYI
	MOVLW D'1'
	MOVWF YUZ2
	CALL KOMUT
KONTROL
	BSF PORTB,2
	BCF PORTB,3
	BTFSC PORTA,0
	GOTO ARTIR
	BTFSC PORTA,1
	GOTO AZALT
;SATIR1
	MOVLW H'80'
	CALL KOMUT_YAZ
	MOVFW YUZ1
	CALL LOOKUP
	CALL VERI_YAZ
	MOVLW H'81'
	CALL KOMUT_YAZ
	MOVFW ON1
	CALL LOOKUP
	CALL VERI_YAZ
	MOVLW H'82'
	CALL KOMUT_YAZ
	MOVFW BIR1
	CALL LOOKUP
	CALL VERI_YAZ
	CALL GECIKME ;;
;SATIR2
	MOVLW H'C0'
	CALL KOMUT_YAZ
	MOVFW YUZ2
	CALL LOOKUP
	CALL VERI_YAZ
	MOVLW H'C1'
	CALL KOMUT_YAZ
	MOVFW ON2
	CALL LOOKUP
	CALL VERI_YAZ
	MOVLW H'C2'
	CALL KOMUT_YAZ
	MOVFW BIR2
	CALL LOOKUP
	CALL VERI_YAZ
	CALL GECIKME ;;	
	GOTO KONTROL
ARTIR
	BTFSC PORTA,0
	GOTO ARTIR
	INCF BIR2,F
	MOVFW BIR2
	SUBLW D'10'
	BTFSS STATUS,Z
	GOTO KONTROL
	CLRF BIR2
	INCF ON2,F
	MOVFW ON2
	SUBLW D'10'
	BTFSS STATUS,Z
	GOTO KONTROL
	CLRF ON2
	INCF YUZ2,F
	MOVFW YUZ2
	SUBLW D'2'
	BTFSS STATUS,Z
	GOTO KONTROL
	CLRF YUZ2
	GOTO KONTROL
AZALT
	BTFSC PORTA,1
	GOTO AZALT
	CLRF YUZ2
	CLRF ON2
	CLRF BIR2
	MOVFW SAYI
	SUBLW D'0'
	BTFSC STATUS,Z
	GOTO KONTROL
	DECF SAYI,F
	MOVFW SAYI
	MOVWF SAYITMP
	GOTO BOL_YUZ
BOL_YUZ
	MOVLW D'100'
	SUBWF SAYI,W
	BTFSS STATUS,C
	GOTO BOL_ON
	INCF YUZ2
	MOVWF SAYI
	GOTO BOL_YUZ
BOL_ON
	MOVLW D'10'
	SUBWF SAYI,W
	BTFSS STATUS,C
	GOTO BIRLER
	INCF ON2
	MOVWF SAYI
	GOTO BOL_ON
BIRLER
	MOVLW D'255'
	ADDWF SAYI,W
	MOVWF BIR2
	INCF BIR2,F
	MOVFW SAYITMP
	MOVWF SAYI
	GOTO KONTROL
KOMUT
	MOVLW H'02'
	CALL KOMUT_YAZ
	MOVLW H'2C'
	CALL KOMUT_YAZ
	MOVLW H'0C'
	CALL KOMUT_YAZ
	RETURN
KOMUT_YAZ
	BANKSEL PORTD
	MOVWF PORTD
	BCF PORTB,5
	BCF PORTB,4
	BSF PORTB,6
	
	CALL GECIKME
	BCF PORTB,6
	RETURN
VERI_YAZ
	BANKSEL PORTD
	MOVWF PORTD
	BCF PORTB,5
	BSF PORTB,4
	BSF PORTB,6
	CALL GECIKME
	BCF PORTB,6
	RETURN
LOOKUP
	ADDWF PCL,F
	RETLW '0'
	RETLW '1'
	RETLW '2'
	RETLW '3'
	RETLW '4'
	RETLW '5'
	RETLW '6'
	RETLW '7'
	RETLW '8'
	RETLW '9'
GECIKME
	MOVLW D'20'
	MOVWF SAYAC0
GECIKME1
	MOVLW D'30'
	MOVWF SAYAC1
GECIKTIR
	DECFSZ SAYAC1,F
	GOTO GECIKTIR
	DECFSZ SAYAC0,F
	GOTO GECIKME1
	RETURN
SON
	END