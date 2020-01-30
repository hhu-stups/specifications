MACHINE RecursiveFunctions
DEFINITIONS
  EXTERNAL_FUNCTION_REC(A,B) == (STRING * A)-->B;
  REC(F,A) == F(A);
  EXTERNAL_FUNCTION_REC_LET(A) == (STRING * A)-->A;
  REC_LET(F,A) == A;
  EXTERNAL_FUNCTION_CHOOSE(T) == (POW(T)-->T);
  CHOOSE(X) == "a member of X";
  SET_PREF_MAXINT ==  3 ;
  /* SET_PREF_SYMBOLIC == TRUE; */
  SET_PREF_EXPAND_CLOSURES_FOR_STATE == FALSE 
CONSTANTS fib, fac, sigma
PROPERTIES
 fac: INTEGER <-> INTEGER &
 fac = REC_LET("fac",%x.(x=1|1) \/ %x.(x>1|x*REC("fac",x-1) )) &
 fib: INTEGER <-> INTEGER &
 fib = REC_LET("fib",%x.(x<2|1) \/ %x.(x>=2|REC("fib",x-1)+REC("fib",x-2) )) &
 sigma: POW(INTEGER) <-> INTEGER &
  sigma = REC_LET("sigma",%x.(x={}|0) \/ %x.(x:POW1(INTEGER)|CHOOSE(x)+REC("sigma",x-{CHOOSE(x)}))) 
 /*
 sigma = REC_LET("sigma",%x.(x={}|0) \/ {x,r|x:POW1(INTEGER) & #c.(c=CHOOSE(x) & r=c+REC("sigma",x-{c}))}) */ /* with common-subexpression elimimnation this should no longer be necessary */
ASSERTIONS
 fib(1) = 1; fib(2)=2; fib(3) = 3; fib(10)=89;
 fac(4) = 24;
 {x|#y.(y:1..3 & x= fib(y))} = 1..3;
 sigma({3,5,7}) = 15;
 sigma(1..1000) = 500500;
 SIGMA(z).(z:1..1000|z) = 500500; /* about 7 times faster than sigma */
 sigma(1..100) = SIGMA(z).(z:1..100|z);
 !y.(y:POW1(7..9) => sigma(y) = SIGMA(z).(z:y|z)) 
OPERATIONS
 r <-- FIB1 = BEGIN r:= fib(1) END;
 r <-- FIB(x) = PRE x: 2..10 THEN r:= fib(x) END;
 r <-- FAC(x) = PRE x: 2..10 THEN r:= fac(x) END
END

