MainLoop:
rcall DelayNCycles ;
rjmp MainLoop
DelayNCycles: ;zwyk�a etykieta
rcall Podprogram
nop
nop
nop
ret ;powr�t do miejsca wywo�ania

//1,25 mikrosekundy

Podprogram:
ldi R16, 8
ret