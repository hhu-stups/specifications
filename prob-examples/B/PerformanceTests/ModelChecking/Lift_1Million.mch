MACHINE Lift_1Million
DEFINITIONS
  SET_PREF_MAXINT == 2147483647
//  HEURISTIC_FUNCTION == 2**64+floor-100
CONCRETE_VARIABLES  floor, n
INVARIANT n:NAT & floor : 0..n /* NAT */
INITIALISATION n:=1000000 || floor := 4
OPERATIONS
	inc = PRE floor<n THEN floor := floor + 1 END ;
	dec = PRE floor>0  THEN floor := floor - 1 END
END