ldi R20, 100
ldi R21, 200

add R20, R21
ldi R21, 0 //wyzerowanie R21
adc R21, R21 // R21 (0) + R21 (0) + C (1) = C (1)

