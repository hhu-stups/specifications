MACHINE ConstantsAndTrace
CONSTANTS
  c1,c2
PROPERTIES
  c1 : 1..100 & c2 : c1..100
VARIABLES
  x
INVARIANT
  x: c1..c2
INITIALISATION
  x := c1
OPERATIONS
  Inc = PRE x<c2 THEN x := x+1 END;
  r <-- Stop = SELECT x=c2 THEN r := x END
END
