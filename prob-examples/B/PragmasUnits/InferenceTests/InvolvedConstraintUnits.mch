MACHINE InvolvedConstraintUnits
VARIABLES /*@ unit "m" */ x,y,w, /*@ unit "s" */v
INVARIANT
 x:INTEGER & y:INTEGER & w:INTEGER & v:INTEGER
INITIALISATION x,y,v,w := 1,1,1,1
OPERATIONS
  Op = BEGIN v := (x*y)*v END  /* should imply x*y has no dimension and therefore that y has dimension 1/m */
END
