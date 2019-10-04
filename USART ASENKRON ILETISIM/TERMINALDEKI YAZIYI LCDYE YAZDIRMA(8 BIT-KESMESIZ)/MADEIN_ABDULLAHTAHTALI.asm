#INCLUDE <P16F877A.INC>
GEC�K EQU 0X21
GEC�K2 EQU 0X22
	ORG 0X00
MAIN
	BANKSEL TRISB
	CLRF TRISB
	CLRF TRISD
	BSF TRISC,7
	BANKSEL PORTB
	CLRF PORTB
	CLRF PORTC
	CLRF PORTD
	BANKSEL SPBRG
	MOVLW D'25'
	MOVWF SPBRG
	BANKSEL TXSTA
	MOVLW B'00000100'
	MOVWF TXSTA
	BANKSEL RCSTA
	BSF RCSTA,SPEN
	BSF RCSTA,CREN
	BSF PORTB,2
	BCF PORTB,3
	CALL LCD_YAZ
KONTROL
	BANKSEL PIR1
	BTFSS PIR1,RCIF
	GOTO KONTROL
	BANKSEL RCREG
	MOVF RCREG,W
	CALL VERI_YAZ
	GOTO KONTROL
LCD_YAZ
	MOVLW 0X02
	CALL KOMUT_YAZ
	MOVLW 0X38	
	CALL KOMUT_YAZ
	MOVLW 0X0C
	CALL KOMUT_YAZ
	MOVLW 0X80
	CALL KOMUT_YAZ
	RETURN
KOMUT_YAZ
	BANKSEL PORTD
	MOVWF PORTD
	;BCF PORTB,5
	BCF PORTB,4
	BSF PORTB,6
	CALL GECIKME
	BCF PORTB,6
	RETURN
VERI_YAZ
	BANKSEL PORTD
	MOVWF PORTD
	;BCF PORTB,5
	BSF PORTB,4
	BSF PORTB,6
	CALL GECIKME
	BCF PORTB,6
	RETURN

GECIKME	
	MOVLW D'20'
	MOVWF GEC�K
	MOVWF GEC�K2
DON1
	DECFSZ GEC�K
	GOTO DON2
	RETURN
DON2 
	DECFSZ GEC�K2
	GOTO DON2
	MOVLW D'20'
	MOVWF GEC�K2
	GOTO DON1
SON
	END
