			
			ldi R22, 100						//delay period
					
			// R16 - m�odszy bajt
			// R17 - starszy bajt
			// R21 - musi by� r�wne 0

			ldi R20, 33		//tyle dodajemy do licznika - wtedy kliknie 1986 razy i si� przepe�ni
			ldi R21, 0

			// - petla Delay
Delay:		ldi R16, 0 
			ldi R17, 0 

			
				// - petla zliczajaca 1    (R*4) + 1
Wait1:		add R16, R20
			adc R17, R21

			brbc 0, Wait1
				// petla zliczajaca 1 - 		
			
												// Dwie p�tle zliczaj�ce dla wi�kszej dok�adno�ci

			dec R22
			brbc 1, Delay


			end:
	rjmp end
							//debug