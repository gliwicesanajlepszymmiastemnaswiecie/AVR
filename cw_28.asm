//PORTB 
ldi R16, (1<<PB1) |(1<<PB2) |(1<<PB3) |(1<<PB4)
out DDRB, R16 

Mainloop:
	ldi R16, (1<<PB1) |(1<<PB2) |(1<<PB3) |(1<<PB4)
	out PORTB, R16
	rcall Delay
	ldi R16, 0
	out PORTB, R16
	rcall Delay
	rjmp Mainloop

Delay:
    ldi R17, 100
DelayLoop:
    dec R17
    brne DelayLoop
    ret