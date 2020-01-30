MACHINE Lift

VARIABLES  floor

INVARIANT  floor : 0..100

INITIALISATION floor := 0

OPERATIONS

	inc = PRE floor<100 THEN floor := floor + 1 END ;

	dec = PRE floor>0 THEN floor := floor - 1 END

END