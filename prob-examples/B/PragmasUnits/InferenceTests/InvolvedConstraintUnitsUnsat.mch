MACHINE InvolvedConstraintUnitsUnsat
VARIABLES /*@ unit "m" */ x,y,w, /*@ unit "s" */v
INVARIANT
 x:INTEGER & y:INTEGER & w:INTEGER & v:INTEGER
INITIALISATION x,y,v,w := 1,1,1,1
OPERATIONS
  Op = BEGIN v := (x*y)*v + (x*y*y)*v END  /* is in principle a unit error */
END
