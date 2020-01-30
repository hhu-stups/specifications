MACHINE UnsatTest1
DEFINITIONS
 SET_PREF_MAXINT == 100
CONSTANTS x,y,z
PROPERTIES
 x > 1 & x>2 & x>0 &
 x <10 &
 y > x &
 x > z &
 z > y &
 z <12 &
 y > 2
/*
 UNSAT core should be:
 y > x
 x > z
 z > y
*/
END

