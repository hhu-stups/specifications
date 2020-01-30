MACHINE ProBLatex
 // machine is there just to import external definitions
VARIABLES x
ASSERTIONS
  /*@label thm1 */ 2**10 = 1024;
  /*@label thm2 */ SIGMA(a).(a:1..100|a) = 5050
INVARIANT
  /*@label inv0 */ x:NATURAL &
  /*@label inv1 */ UNION(a).(a<:1..3|a) = 1..3 &  /* not really over variables */
  /*@label inv2 */ INTER(a).(a<:1..3|a) = {}
INITIALISATION
  x:=1
OPERATIONS Inc = PRE x<10 THEN x:=x+1 END
DEFINITIONS
 "LibraryMeta.def";
 EXTERNAL_FUNCTION_SORT(X) == POW(X) --> POW(INTEGER*X);
 SORT(x) == []
END