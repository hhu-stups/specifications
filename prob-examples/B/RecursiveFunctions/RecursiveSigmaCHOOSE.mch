MACHINE RecursiveSigmaCHOOSE
DEFINITIONS
  EXTERNAL_FUNCTION_CHOOSE(T) == (POW(T)-->T);
  CHOOSE(X) == "a member of X";
  SET_PREF_MAXINT ==  3 ;
  /* SET_PREF_SYMBOLIC == TRUE;
  SET_PREF_EXPAND_CLOSURES_FOR_STATE == FALSE  */
 printf(s,x) == TRUE=TRUE;
 EXTERNAL_PREDICATE_printf(T) == STRING*T;
    /* printf could also be used as external function STRING*T --> BOOL */
 vprintf(s,x) == x;
 EXTERNAL_FUNCTION_vprintf(T) == STRING*T --> T /* value printf: print and return value as result */
ABSTRACT_CONSTANTS sigma
PROPERTIES
  sigma: POW(INTEGER) <-> INTEGER &
  sigma =%x.(x={}|0) \/
         %x.(x/={} /* & printf("recurse~w~n",x) */|vprintf("choose:~w~n",CHOOSE(x))+sigma(x-{CHOOSE(x)}))
 /* with common-subexpression elimimnation this should no longer be necessary */
ASSERTIONS
 sigma({3,5,7}) = 15;
 sigma(1..1000) = 500500;
 SIGMA(z).(z:1..1000|z) = 500500; /* about 7 times faster than sigma */
 sigma(1..100) = SIGMA(z).(z:1..100|z);
 /* !y.(y:POW1(7..9) => sigma(y) = SIGMA(z).(z:y|z));   negation of this times out */
 !y.(y:{{},{8},{9},{8,9}} => sigma(y) >= 0 )  /* negation of this times out */
OPERATIONS
 Check1(y) = PRE y:{{},{8},{9},{8,9}} & sigma(y) < 0 THEN skip END ;
 r <-- Check = IF !y.(y:{{},{8},{9},{8,9}} => sigma(y) >= 0 ) THEN r:= TRUE ELSE r:= FALSE END
END

