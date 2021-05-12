MACHINE EnumerationWarning
SETS
 ID={aa,bb}
CONSTANTS x
PROPERTIES
 x:NATURAL
VARIABLES y
INVARIANT
 y > x & y mod 100 = 0 & y mod 50 = 1
 // No solution exists; looking for valid state will lead to enumeration warning
INITIALISATION y:=x+1
OPERATIONS inc = SELECT y<100 THEN y := y+1 END
ASSERTIONS 
  !y.( y > x & y mod 100 = 0 => not(y mod 50 = 1))
END

