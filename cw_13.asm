outer_loop:
ldi R20, 5
loop:
dec R20
brne loop
rjmp outer_loop

//14
//cycles = R20*3 - 1
