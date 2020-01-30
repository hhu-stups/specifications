MACHINE WhileLoopBench_v1
CONSTANTS large
PROPERTIES large = {x,y| x:1..2**15 & y=x+2} /* does not influence runtime */
VARIABLES i,j,k, count
INVARIANT
  i:NATURAL & j:NATURAL & k:NATURAL & count:NATURAL & i<= count 
INITIALISATION i,j,k,count := 0,0,0,10
OPERATIONS
  Seti = PRE i<count THEN
            WHILE i<count DO
              i := i + 1
            INVARIANT i<=count
            VARIANT count-i
            END
         END;
  DoubleCount = PRE i=count THEN count := count*2 || i,j,k := 0,0,0 END
END

