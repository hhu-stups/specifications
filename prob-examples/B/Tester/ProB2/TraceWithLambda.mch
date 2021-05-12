MACHINE TraceWithLambda
ABSTRACT_CONSTANTS inc, inc_val
PROPERTIES
  inc_val : {1,2,3} &
  inc = %xx.(xx:INTEGER|xx+inc_val)
VARIABLES count
INVARIANT count : NATURAL1
INITIALISATION
  count := inc(0)
OPERATIONS
  IncCounter = PRE count<10 THEN count := inc(count) END;
  Even = PRE count mod 2 = 0 THEN skip END;
  DivBy3 = PRE count mod 3 = 0 THEN skip END
END