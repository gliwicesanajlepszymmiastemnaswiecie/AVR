Mainloop:
	clr R1  //upewnienie, ¿e R1=0
	ldi R16, 2
	rcall DigitTo7segCode
	ret

DigitTo7segCode:
	ldi ZL, low(Tablica<<1) 
	ldi ZH, high(Tablica<<1)

	add ZL, R16
	adc ZH, R1
	lpm R16, Z
	ret

Tablica: .db 0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100100, 0b01011101, 0b01111101, 0b00000111, 0b011111111, 0b01101111
