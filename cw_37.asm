

Mainloop:
	clr R1  //upewnienie, ¿e R1=0
	ldi R16, 2
	rcall Converter

Converter:
	ldi ZL, low(Tablica<<1) 
	ldi ZH, high(Tablica<<1)

	add ZL, R16
	adc ZH, R1
	lpm R16, Z
	ret

Tablica: .db 0, 1, 4, 9, 16, 25, 36, 49, 64, 81
