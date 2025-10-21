

ldi R19, 125
outer_loop:
	ldi R20, 19
	inner_loop:
		nop
		dec R20
		brne inner_loop
	nop
	dec R19
	brne outer_loop
end:
    rjmp end



