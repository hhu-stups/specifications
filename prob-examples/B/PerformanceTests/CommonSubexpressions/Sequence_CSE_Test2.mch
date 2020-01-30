MACHINE Sequence_CSE_Test2
INCLUDES Increment
DEFINITIONS SET_PREF_CSE == TRUE; SET_PREF_CSE_SUBST == TRUE;
 SET_PREF_MAXINT == 101
 /*
 probcli /Users/leuschel/git_root/prob_examples/public_examples/B/PerformanceTests/CommonSubexpressions/Sequence_CSE_Test2.mch -mc 1002 -nodead -bf -hash64 275624188322798846
 */
VARIABLES n,x,y,z,u
INVARIANT
  n:NATURAL &
  x: INTEGER & y:INTEGER & z:INTEGER & u:INTEGER
INITIALISATION n,x,y,z,u := 0,0,0,0,0
OPERATIONS
  IncN = SELECT n<100 THEN n:= (n+1)*2 END;
  Modify = SELECT x+1 < 100 THEN
             x :: {x+1, x+2-1};
             y <-- Inc(x);
             z : (z = x+1);
             u := (x+1) + (x+1)
           END
END