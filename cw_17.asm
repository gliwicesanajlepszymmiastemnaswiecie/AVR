ldi R22, 5
out_outer_loop:

	ldi R19, 100
	outer_loop:
		ldi R20, 19
		inner_loop:
			nop
			dec R20
			brne inner_loop
		nop
		dec R19
		brne outer_loop
	dec R22
	brne out_outer_loop
end:
	rjmp end
