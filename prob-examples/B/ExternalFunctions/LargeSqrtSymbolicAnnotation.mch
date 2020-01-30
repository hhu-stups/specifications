MACHINE SymbolicInfiniteFunction
DEFINITIONS
 SET_PREF_MAXINT == 19999; /* with 20000 or larger ProB will keep mysqr as symbolic */
 SYMBOLIC(x) == x;
 /* EXTERNAL_FUNCTION_SYMBOLIC(X) == (X --> X) */
ABSTRACT_CONSTANTS mysqr
PROPERTIES
 mysqr = %x.(x:NAT|SYMBOLIC(x*x)) /* a square function over NAT */
VARIABLES xx, ms
INVARIANT
 xx:NATURAL1 & ms : INTEGER <-> INTEGER
INITIALISATION xx:=1 || ms:= mysqr
OPERATIONS
  Inc = xx := xx+1;
  Inc5 = xx := xx+5;
  r <-- Square = IF xx:dom(mysqr) THEN r:= mysqr(xx) ELSE r:= -1 END
END

