MACHINE WhileLoop_CSE_Test5
/* Test that operation call modification detected */
INCLUDES Increment
/* call
probsli /Users/leuschel/git_root/prob_examples/public_examples/B/PerformanceTests/CommonSubexpressions/WhileLoop_CSE_Test5.mch -mc 1002 -nodead -bf -hash64 631025155851917155 */
DEFINITIONS SET_PREF_CSE == TRUE; SET_PREF_CSE_SUBST == TRUE
VARIABLES n,x,y,z
INVARIANT
  n:NATURAL &
  x: INTEGER & y:INTEGER & z:INTEGER
INITIALISATION n,x,y,z := 0,0,0,0
OPERATIONS
  IncN = SELECT (n+1)*2 < MAXINT THEN n:= (n+1)*2 END;
  r <-- Compute = VAR i,j,k IN
            BEGIN
             i := 0; j:= 1; k := (i*i - (i+i)); 
             WHILE i <= n DO
              x := x + (i*i - (i+i));
              y := x + (i*i - (i+i));
              i <-- Inc(i);
              z := z + (n+n)/2
            INVARIANT i:0..(n+1)
            VARIANT (n-i)
            END
           END;
           r := (x,y,z)
          END
END

