ldi R19, 25
outer_loop:
	ldi R20, 20
	inner_loop:
		nop
		dec R20
		brne inner_loop
	dec R19
	brne outer_loop






