MACHINE WhileLoopBench_v2
CONSTANTS large
PROPERTIES large = {x,y| x:1..2**15 & y=x+2} /* does not influence runtime */
VARIABLES i,j,k, count, large2
INVARIANT
  i:NATURAL & j:NATURAL & k:NATURAL & count:NATURAL & i<= count &
  large2 : POW(INTEGER*INTEGER)
INITIALISATION i,j,k,count := 0,0,0,10 ||
  large2 := {x,y| x:1..2**15 & y=x+2} /* no slow down */
OPERATIONS
  Seti = PRE i<count THEN
            WHILE i<count DO
              i := i + 1
            INVARIANT i<=count
            VARIANT count-i
            END;
            large2 := large2 \/ {}
         END;
  DoubleCount = PRE i=count THEN count := count*2 || i,j,k := 0,0,0 END
END

