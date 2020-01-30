MACHINE WhileLoopBenchMAXINT
VARIABLES i,j,k, count
INVARIANT
  i:NATURAL & j:NATURAL & k:NATURAL & count:NATURAL & i<= count
INITIALISATION i,j,k,count := 0,0,0,MAXINT
OPERATIONS
  Seti = PRE i<count THEN
            WHILE i<count DO
              i := i + 1
            INVARIANT i<=count
            VARIANT count-i
            END;
            j := 1
         END
ASSERTIONS
   (j=1 => i=count)
END
/*
probcli ../prob_examples/public_examples/B/PerformanceTests/WhileLoopBenchMAXINT.mch -p MAXINT 400000 -animate_all -animate_stats -p TIME_OUT 50000
*/
