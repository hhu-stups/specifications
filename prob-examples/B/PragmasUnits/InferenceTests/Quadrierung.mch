MACHINE Quadrierung
VARIABLES /*@ unit "0*m**4" */ x, y,w, /*@ unit "s" */v
INVARIANT
 x:INTEGER & y:INTEGER & w:INTEGER & v:INTEGER
INITIALISATION x,y,v,w := 1,1,1,1
OPERATIONS
  Op = PRE y*y = x THEN  /* y should be m^2 */
   v := (x/(y*y*y*y))*v END  /* should imply x*y has no dimension and therefore that y has dimension m; this is in conflict with m^2 in PRE */
END
