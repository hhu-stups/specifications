MACHINE Lift2
CONCRETE_VARIABLES  floor, n
INVARIANT n:NAT & floor : 0..n /* NAT */
INITIALISATION n:=99 ; floor := 4
OPERATIONS
	inc = PRE floor<n THEN floor := floor + 1 END ;	
	dec = PRE floor>0  THEN floor := floor - 1 END 
END
