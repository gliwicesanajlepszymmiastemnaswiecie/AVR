ldi R22, 7 
//ldi R21, 0
//ldi R20, 1

Delay: 
	ldi R16, $FA//$31
	ldi R17, $FF//$F8
Inner_loop:
	subi R16, $FF
	sbci R17, $FF
	brbs 0, Inner_loop
	
dec R22
brbc 1, Delay

end:
	rjmp end


