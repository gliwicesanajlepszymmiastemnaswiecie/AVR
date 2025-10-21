MainLoop:
rcall DelayNCycles ;
rjmp MainLoop
DelayNCycles: ;zwyk³a etykieta
rcall Podprogram
nop
nop
nop
ret ;powrót do miejsca wywo³ania

//1,25 mikrosekundy

Podprogram:
ldi R16, 8
ret