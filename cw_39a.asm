.equ Digits_P = PORTB
.equ Segments_P = PORTD

.def Digit_0 = R2
.def Digit_1 = R3
.def Digit_2 = R4
.def Digit_3 = R5

ldi R16, 0b00011110  ; Ustawienie pinów PB1-PB4 jako wyjœcia dla cyfr
out DDRB, R16

; Test 1: „3210”
ldi R16, 0
mov Digit_0, R16

ldi R16, 1
mov Digit_1, R16

ldi R16, 2
mov Digit_2, R16

ldi R16, 3
mov Digit_3, R16

; Test 2: „7654”
; Test 3: „9876”

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
	rcall DigitTo7segCode
	rjmp Display

LoadDigit1:
	mov R16, R3
	rcall DigitTo7segCode
	rjmp Display

LoadDigit2:
	mov R16, R4
	rcall DigitTo7segCode
	rjmp Display

LoadDigit3:
	mov R16, R5
	rcall DigitTo7segCode
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


DigitTo7segCode:
	ldi ZL, low(Tablica<<1) 
	ldi ZH, high(Tablica<<1)

	add ZL, R16
	adc ZH, R1
	lpm R16, Z
	ret

Tablica: .db 0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100100, 0b01011101, 0b01111101, 0b00000111, 0b011111111, 0b01101111

