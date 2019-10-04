#INCLUDE <P16F877A.INC>
	ORG 0X00
MAIN
	BANKSEL TRISB
	BSF TRISC,7
	CLRF TRISB
	BANKSEL PORTB
	CLRF PORTB
	CLRF PORTC
	BANKSEL SPBRG
	MOVLW D'25'
	MOVWF SPBRG
	BANKSEL TXSTA
	MOVLW B'00000100'
	MOVWF TXSTA
	BANKSEL RCSTA
	MOVLW B'10010000'
	MOVWF RCSTA
KONTROL
	BANKSEL PIR1
	BTFSC  PIR1,RCIF
	GOTO YAZ
	GOTO KONTROL
YAZ
	BANKSEL RCREG
	MOVFW RCREG
	MOVWF PORTB
	GOTO KONTROL
	END