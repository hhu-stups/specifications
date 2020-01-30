MACHINE 
  UsedOk

SETS
  B = {b0,b1,b2}

VARIABLES 
  bObj

INVARIANT 
  bObj <: B
  
INITIALISATION 
  bObj := {}

OPERATIONS
addB(b) = 
  PRE
    b : B
  THEN
    bObj := bObj \/ {b}
  END
END