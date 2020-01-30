MACHINE VerySimpleCounterWrong
CONSTANTS lim
PROPERTIES lim = 2**25
VARIABLES ct
INVARIANT
 ct:INTEGER & ct < lim
INITIALISATION ct::0..(lim-1)
OPERATIONS
  Inc(i) = PRE i:1..1000 & ct + i <= lim THEN ct := ct+i END;
  Reset = PRE ct = lim THEN ct := 0 END
END

/*
TLC generates
Computing initial states...
Error: Too many possible next states for the last state in the trace.
*/