Mainloop:
ldi R16, 7
rcall DelayInMs
rjmp Mainloop

DelayInMs:
	push R16  //27b)
	rcall DelayOneMs
	dec R16
	brne DelayInMs
	pop R16  //27b)
	ret

DelayOneMs:
	push R16
	push R17
	ldi R16, $33
	ldi R17, $F8
	Inner_loop:
		subi R16, $FF
		sbci R17, $FF
		brbc 1, Inner_loop
		//brbs 0, Inner_loop
		pop R17  //kolejnosc LIFO
		pop R16
		ret


