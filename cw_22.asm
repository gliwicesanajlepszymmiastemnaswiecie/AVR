Mainloop:
ldi R22, 1
rcall DelayInMs
dec R22
rjmp Mainloop

DelayInMs:
	ldi R16, $30
	ldi R17, $F8
Inner_loop:
	subi R16, $FF
	sbci R17, $FF
	brbs 0, Inner_loop
	
brbc 1, DelayInMs
ret