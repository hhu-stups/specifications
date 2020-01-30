MACHINE BF_test
DEFINITIONS
  GOAL == (x>10 & y>10 & z>10)
VARIABLES x,y,z
INVARIANT
 x:NATURAL & y:NATURAL & z:NATURAL
INITIALISATION x,y,z := 0,0,0
OPERATIONS
  IncX = x := x+1;
  IncY = y := y+1;
  IncZ = z := z+1
END

