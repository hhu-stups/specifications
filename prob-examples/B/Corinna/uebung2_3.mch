MODEL
   uebung2_3

VARIABLES y 

INVARIANT  y : NAT

INITIALISATION y := 0

OPERATIONS 
	xx,aa <-- function = 
		ANY x WHERE x : 1..100 THEN 
			SELECT (x mod 2) = 0 THEN xx,aa := x,x/2 
			  WHEN (x mod 2) /= 0 THEN xx,aa := x,(x-1)/2
			END
		END

END