MACHINE Parity
DEFINITIONS SET_PREF_MAX_OPERATIONS == 12
ABSTRACT_CONSTANTS parity
PROPERTIES
  parity : INTEGER <-> INTEGER & 
  parity = {0|->0} \/ %x.(x:NATURAL1|1-parity(x-1))
OPERATIONS
  r <-- GetParity(x) = PRE x:0..10 THEN r:= parity(x) END
ASSERTIONS
  !x.(x:1..50 => parity(x):0..1 & parity(x) = x mod 2);
  parity[1..10] = 0..1; /* no longer causes expansion and time-out */
  ([1,2];parity) = [1,0]; /* causes expansion and time-out */
  parity : INTEGER +-> INTEGER;  /* also causes expansion; investigate */
  parity : (NATURAL --> {0,1}) /* causes expansion and time-out */
END

