Mainloop:
ldi R16, 7
rcall DelayInMs
rjmp Mainloop

DelayInMs:
	rcall DelayOneMs
	dec R16
	brne DelayInMs
	ret

DelayOneMs:
	sts 0x60, R16
	sts 0x61, R17
	ldi R16, $33
	ldi R17, $F8
	Inner_loop:
		subi R16, $FF
		sbci R17, $FF
		brbs 0, Inner_loop
		lds R16, 0x60
		lds R17, 0x61
		ret
