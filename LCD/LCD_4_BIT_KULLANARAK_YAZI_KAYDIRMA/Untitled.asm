#INCLUDE <P16F877A.INC>
SAYAC0 EQU 0X20
SAYAC1 EQU 0X21
LCD_DATA EQU 0X22
SAYI0 EQU 0X23
SAYI1 EQU 0X24
	ORG 0X00
MAIN
	BANKSEL TRISB
	CLRF TRISB
	BANKSEL PORTB
	CLRF PORTB
	MOVLW H'82'
	MOVWF SAYI0
	MOVLW H'80'
	MOVWF SAYI1
	CALL KOMUT
	CALL EKRAN
KOMUT
	MOVLW H'02'
	CALL KOMUT_YAZ
	MOVLW H'0C'
	CALL KOMUT_YAZ
	RETURN
KOMUT_YAZ
	MOVWF LCD_DATA
	SWAPF LCD_DATA,W
	CALL KOMUT_GONDER
	MOVF LCD_DATA,W
	CALL KOMUT_GONDER
	RETURN
KOMUT_GONDER
	ANDLW D'15'
	MOVWF PORTB
	BCF PORTB,4
	BSF PORTB,5
	CALL GECIKME
	BCF PORTB,5
	RETURN
VERI_YAZ
	MOVWF LCD_DATA
	SWAPF LCD_DATA,W
	CALL VERI_GONDER
	MOVF LCD_DATA,W
	CALL VERI_GONDER
	RETURN
VERI_GONDER
	ANDLW D'15'
	MOVWF PORTB
	BSF PORTB,4
	BSF PORTB,5
	CALL GECIKME
	BCF PORTB,5
	RETURN
GECIKME
	MOVLW D'100'
	MOVWF SAYAC0
GECIKME1
	MOVLW D'100'
	MOVWF SAYAC1
GECIKTIR
	DECFSZ SAYAC1,F
	GOTO GECIKTIR
	DECFSZ SAYAC0,F
	GOTO GECIKME1
	RETURN
EKRAN
EKRAN_ARTIR
	MOVFW SAYI0
	SUBLW H'8F'
	BTFSC STATUS,Z
	GOTO EKRAN_AZALT
	INCF SAYI0,F
	INCF SAYI1,F
	MOVLW H'01'
	CALL KOMUT_YAZ
	MOVFW SAYI0
	CALL KOMUT_YAZ
	CALL LOOKUP
	GOTO EKRAN_ARTIR
EKRAN_AZALT	
	MOVFW SAYI1
	SUBLW H'80'
	BTFSC STATUS,Z
	GOTO EKRAN_ARTIR
	DECF SAYI1,F
	DECF SAYI0,F
	MOVLW H'01'
	CALL KOMUT_YAZ
	MOVFW SAYI1
	CALL KOMUT_YAZ
	CALL LOOKUP
	GOTO EKRAN_AZALT	
LOOKUP
	MOVLW 'A'
	CALL VERI_YAZ
	MOVLW 'L'
	CALL VERI_YAZ
	MOVLW 'I'
	CALL VERI_YAZ
	RETURN
	
	END