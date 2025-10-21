Mainloop:
ldi R22, 7
rcall DelayInMs
rjmp Mainloop

DelayInMs:
	rcall DelayOneMs
	dec R22
	brne DelayInMs
	ret

DelayOneMs:
	ldi R16, $31
	ldi R17, $F8
	Inner_loop:
		subi R16, $FF
		sbci R17, $FF
		brbs 0, Inner_loop
		ret