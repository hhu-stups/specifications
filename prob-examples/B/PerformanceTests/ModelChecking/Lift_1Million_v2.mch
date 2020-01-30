MACHINE Lift_1Million_v2 /* n as constant */
DEFINITIONS
  SET_PREF_MAXINT == 2147483647
CONSTANTS n
PROPERTIES n = 1000000 & n:NAT
CONCRETE_VARIABLES  floor
INVARIANT  floor : 0..n /* NAT */
INITIALISATION  floor := 4
OPERATIONS
	inc = PRE floor<n THEN floor := floor + 1 END ;
	dec = PRE floor>0  THEN floor := floor - 1 END
END