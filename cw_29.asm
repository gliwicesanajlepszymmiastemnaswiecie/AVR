ldi R16, 0b01111111  //PD0–PD6 jako wyjœcia (segmenty A–G)
out DDRD, R16		
					
ldi R16, 0b00000010
out DDRB, R16	

Mainloop:
	ldi R16, 0b00111111 //cyfra 0
	out PORTD, R16
	ldi R16, 0b00000010  ; ??? WA¯NE: W³¹cz wyœwietlacz (PB1 = 1)
    out PORTB, R16
	ldi R16, 250
	ldi R17, 0
	rcall DelayInMs

	ldi R16, 0b00000110 //cyfra 1
	out PORTD, R16
	ldi R16, 0b00000010  ; ??? WA¯NE: W³¹cz wyœwietlacz (PB1 = 1)
    out PORTB, R16
	ldi R16, 250
	ldi R17, 0
	rcall DelayInMs

	rjmp Mainloop

//Delay:
   // ldi R16, 250
    //rcall DelayInMs
    //ret

DelayInMs:
	push R16
	push R17

	mov R24, R16
	mov R25, R17
DelayInMs_loop:
	rcall DelayOneMs
	sbiw R25:R24, 1
	brne DelayInMs_loop
	pop R17
	pop R16
	ret

DelayOneMs:
	push R24
	push R25

	ldi R24, $35
	ldi R25, $F8
	Inner_loop:
		subi R24, $FF
		sbci R25, $FF
		brne Inner_loop
	   //kolejnosc LIFO
	pop R25
	pop R24 
	ret