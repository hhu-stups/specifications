MACHINE LiftLarge
DEFINITIONS N == 100000
ABSTRACT_VARIABLES  floor, useless

INVARIANT  floor : 0..N /* NAT */
  & useless : POW(INTEGER)
INITIALISATION floor := 4 || useless := {-1} \/ (1..N) \ {N/2}

OPERATIONS

	inc = PRE floor<N THEN floor := floor + 1 END ;
	
	dec = PRE floor>0 THEN floor := floor - 1 END 

END

