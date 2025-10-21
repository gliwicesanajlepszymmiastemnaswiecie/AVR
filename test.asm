.equ Digits_P = PORTB
.equ Segments_P = PORTD

ldi R16, 0b00000010
out DDRB, R16

; --- Tablica wzorców cyfr 0-3 ---
DigitsTable:
    .db 0b01111001, 0b01011011, 0b00110000, 0b00111111

Mainloop:
    ldi R20, 4              ; licznik cyfr
    ldi R19, 0b00000010     ; wybór pierwszej cyfry (pierwszy tranzystor)
    ldi ZH, high(DigitsTable*2)
    ldi ZL, low(DigitsTable*2)

Digit:
    lpm R16, Z+              ; pobierz kolejny wzorzec segmentów
    out Segments_P, R16
    out Digits_P, R19
    rcall Delay

    lsl R19                  ; nastêpna cyfra
    dec R20
    brne Digit
    rjmp Mainloop


; -------------------------------
; Procedury opóŸnieñ
; -------------------------------

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
    pop R25
    pop R24
    ret
