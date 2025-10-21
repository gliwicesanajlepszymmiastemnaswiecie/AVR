.equ Digits_P = PORTB
.equ Segments_P = PORTD

ldi R16, 0b00011110  ; Ustawienie pinów PB1-PB4 jako wyjœcia dla cyfr
out DDRB, R16

; Inicjalizacja rejestrów z kodami cyfr
ldi R16, 0b01011011  ; Cyfra 2
mov R2, R16
ldi R16, 0b00000110   ; Cyfra 1  
mov R3, R16
ldi R16, 0b01001111  ; Cyfra 3
mov R4, R16
ldi R16, 0b00000111   ; Cyfra 7
mov R5, R16

Mainloop:
	ldi R20, 4
	ldi R19, 0b00000010

Digitloop:
	cpi R19, 0b00000010
	breq LoadDigit0

	cpi R19, 0b00000100
	breq LoadDigit1

	cpi R19, 0b00001000
	breq LoadDigit2

	cpi R19, 0b00010000
	breq LoadDigit3

	rjmp Display

LoadDigit0:
	mov R16, R2
	rjmp Display

LoadDigit1:
	mov R16, R3
	rjmp Display

LoadDigit2:
	mov R16, R4
	rjmp Display

LoadDigit3:
	mov R16, R5
	rjmp Display

Display:
    out Segments_P, R16
    out Digits_P, R19 
    rcall Delay
    
    lsl R19           
    dec R20
    brne Digitloop
    rjmp Mainloop

Delay:
ldi R16, low(5)
ldi R17, high(5)
rcall DelayInMs
ret

DelayInMs:
	push R16
	push R17

	mov R24, R16
	mov R25, R17
DelayInMs_loop:
	rcall DelayOneMs
	sbiw R25:R24, 1
	brne DelayInMs_loop
	pop R17
	pop R16
	ret

DelayOneMs:
	push R24
	push R25

	ldi R24, $35
	ldi R25, $F8
	Inner_loop:
		subi R24, $FF
		sbci R25, $FF
		brne Inner_loop
	   //kolejnosc LIFO
	pop R25
	pop R24 
	ret



