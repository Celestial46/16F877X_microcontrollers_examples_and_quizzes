#INCLUDE <P16F877A.INC>
SAYAC0 EQU 0X20
SAYAC1 EQU 0X21
SAYI EQU 0X22
SAYI_TMP EQU 0X23
DORT EQU 0X24
LCD_DATA EQU 0X25
EEE EQU 0X26
	ORG 0X00
MAIN
	BANKSEL TRISB
	CLRF TRISB
	BANKSEL PORTB
	CLRF PORTB
	MOVLW D'4'
	MOVWF EEE
	MOVLW H'FA'
	MOVWF SAYI
	CALL KOMUT
	GOTO YAZDIR

	
KOMUT
	MOVLW H'02'
	CALL KOMUT_YAZ
	MOVLW H'2C'
	CALL KOMUT_YAZ
	MOVLW H'0C'
	CALL KOMUT_YAZ
KOMUT_YAZ
	MOVWF LCD_DATA
	SWAPF LCD_DATA,W
	CALL KOMUT_GONDER
	MOVFW LCD_DATA
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
	MOVFW LCD_DATA
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
YAZDIR
	MOVLW 0X80
	CALL KOMUT_YAZ	

	MOVLW A'B'
	MOVWF SAYI
	CALL SWAP
	CALL VERI_YAZ

GOTO YAZDIR
	
SOL
	MOVFW SAYI
	ANDLW B'00001111'
	MOVWF SAYI
	MOVLW H'80'
	CALL KOMUT_YAZ
	MOVFW SAYI
	CALL VERI_YAZ
	RETURN
SAG
	RRF SAYI
	DECFSZ DORT,F
	GOTO SAG
	MOVFW SAYI
	ANDLW B'00001111'
	MOVWF SAYI
	MOVFW SAYI
	CALL VERI_YAZ
	RETURN


SWAP
	RRF SAYI,F
	BTFSC STATUS,C
	BSF SAYI,7
	BCF STATUS,C
	DECFSZ EEE,F
	GOTO SWAP
	GOTO YAZDIR



SON
	END
		