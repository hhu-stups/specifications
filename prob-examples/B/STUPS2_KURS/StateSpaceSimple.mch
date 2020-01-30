MACHINE StateSpaceSimple
VARIABLES x,y
INVARIANT
 x:0..2 & y:0..2
INITIALISATION x::0..2 || y::0..2
OPERATIONS
  f = BEGIN y:= max({y-x,0}) END
END

