MACHINE LiftLarge
DEFINITIONS N == 100000
ABSTRACT_VARIABLES  floor

INVARIANT  floor : 0..N /* NAT */

INITIALISATION floor := 4

OPERATIONS

	inc = PRE floor<N THEN floor := floor + 1 END ;
	
	dec = PRE floor>0 THEN floor := floor - 1 END 

END

