MACHINE UnderSpecifiedUnits
VARIABLES /*@ unit "m" */ x,y,w,v
INVARIANT
 x:INTEGER & y:INTEGER & w:INTEGER & v:INTEGER
INITIALISATION x,y,v,w := 1,1,1,1
OPERATIONS
  Op = BEGIN w := (x*y)*v END
END
