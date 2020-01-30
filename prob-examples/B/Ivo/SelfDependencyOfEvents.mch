MACHINE SelfDependencyOfEvents

VARIABLES y

INVARIANT
 y : INTEGER & y < 10

INITIALISATION 
 y:= -5

OPERATIONS
  Event(x) = PRE x:0..2 THEN y := y + x END

END