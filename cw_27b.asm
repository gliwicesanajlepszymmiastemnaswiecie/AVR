Mainloop:
 ldi R16, 100
ldi R17, 0

rcall DelayInMs
rjmp Mainloop

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

