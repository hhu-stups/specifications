MACHINE RecursiveSigmaCHOOSEv3
DEFINITIONS
  "Choose.def"
ABSTRACT_CONSTANTS sigma
PROPERTIES
  sigma: POW(INTEGER) <-> INTEGER &
  sigma = %x.(x:POW(INTEGER) |
              IF x={} THEN 0 ELSE
                LET c BE c=CHOOSE(x) IN c+sigma(x-{c}) END
              END
              )
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

