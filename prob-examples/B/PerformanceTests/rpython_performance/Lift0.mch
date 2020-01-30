MACHINE Lift0
CONCRETE_VARIABLES  floor
INVARIANT floor>=0 & floor<=9999 /* NAT */
INITIALISATION floor := 4
OPERATIONS
	inc = PRE floor<9999 THEN floor := floor + 1 END ;	
	dec = PRE floor>0  THEN floor := floor - 1 END 
END
