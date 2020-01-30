MACHINE Base
CONSTANTS zero
PROPERTIES
 zero = 0
VARIABLES modulo
INVARIANT
 modulo: NATURAL
INITIALISATION modulo := 100
OPERATIONS
  res <-- Add(x,y) = PRE x:NATURAL & y:NATURAL THEN
    res := (x+y+zero) mod modulo
  END;
  res <-- Mul(x,y) = PRE x:NATURAL & y:NATURAL THEN
    res := (x*y+zero) mod modulo
  END;
  res <-- Div(x,y) = PRE x:NATURAL & y:NATURAL1 THEN
    res := (x*y+zero) mod modulo
  END
END

