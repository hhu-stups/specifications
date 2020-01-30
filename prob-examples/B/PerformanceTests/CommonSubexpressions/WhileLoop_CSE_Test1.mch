MACHINE WhileLoop_CSE_Test1
DEFINITIONS SET_PREF_CSE == TRUE; SET_PREF_CSE_SUBST == TRUE
/* 
probsli /Users/leuschel/git_root/prob_examples/public_examples/B/PerformanceTests/CommonSubexpressions/WhileLoop_CSE_Test1.mch -repl -mc 4002 -nodead -bf

without CSE:
* 3001 states checked (50.0% of total 6001), 6001 transitions, 147.722 MB, current 233.97 states/sec
* walltime 0.4 minutes, estimating 13.1 minutes remaining with 191872 states in total
Model Checking Time: 32400 ms (32720 ms walltime)
States analysed: 4002
Transitions fired: 8005

with CSE:
* 3001 states checked (50.0% of total 6001), 6001 transitions, 147.933 MB, current 263.00 states/sec
* walltime 0.4 minutes, estimating 11.6 minutes remaining with 191872 states in total
Model Checking Time: 29090 ms (29290 ms walltime)
States analysed: 4002
Transitions fired: 8005
No Counter Example Found, not all nodes visited
*/
VARIABLES n,x,y,z
INVARIANT
  n:NATURAL &
  x: INTEGER & y:INTEGER & z:INTEGER
INITIALISATION n,x,y,z := 0,0,0,0
OPERATIONS
  IncN = BEGIN n:= (n+1)*2 END;
  r <-- Compute = VAR i IN
            BEGIN
             i := 0;
             WHILE i <= n DO
              x := x + (i*i - (i+i));
              y := y + (i*i - (i+i));
              i := i + 1;
              z := z + (n+n)/2
            INVARIANT i:0..(n+1)
            VARIANT (n-i)
            END
           END;
           r := (x,y,z)
          END
END

