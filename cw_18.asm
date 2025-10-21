ldi R22, 7 // delay period
ldi R21, 0
ldi R20, 1

Delay: 
	ldi R16, $FA //31
	ldi R17, $FF  //f8
Inner_loop:
	add R16, R20
	adc R17, R21
	brbc 0, Inner_loop
	
dec R22
brbc 1, Delay

end:
	rjmp end


	//65535-1998
