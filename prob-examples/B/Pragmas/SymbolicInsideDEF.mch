MACHINE SymbolicInsideDEF
DEFINITIONS
  infdiv == /*@ symbolic */ {x,y|x:NATURAL1 & y:NATURAL1 & y<x & x mod y = 0}
CONSTANTS divisors
PROPERTIES divisors = infdiv
OPERATIONS
  Divisor(yy) = PRE yy:1..100 & 100 |-> yy : divisors THEN skip END;
  DEFDivisor(yy) = PRE yy:1..100 & 100 |-> yy : infdiv THEN skip END
END

