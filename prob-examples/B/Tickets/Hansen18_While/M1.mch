MACHINE M1
CONSTANTS k
PROPERTIES k =52
VARIABLES xx
INVARIANT
xx:1..k
INITIALISATION xx:=1
OPERATIONS
Init = PRE xx : 1..k THEN xx:= 1 END;
Inc = PRE xx < k THEN xx := xx + 1 END;
IncBy(yy) = PRE xx+yy <= k THEN xx := xx + yy END;
 res <-- IncByTwo(aa,bb) = PRE xx+aa+bb <= k THEN 
    xx := xx + aa + bb || res := aa+bb END;
 res <-- IncByTwoStep(aa,bb) = PRE xx+aa+bb <= k 
               & #step.(step=aa+bb)  /* add condition to check variable capture */
   THEN 
    xx :: {step| step>= xx + aa + bb & step < aa+bb+xx+1} || res := aa+bb END;
 res <-- IncByTwoStep1(aa,bb) = PRE xx+aa+bb <= k 
               & #step1.(step1=aa+bb)  /* same version as above, with other variable name  */
   THEN 
    xx :: {step1| step1>= xx + aa + bb & step1 < aa+bb+xx+1} || res := aa+bb END;
  res <-- AddTwice(aa) = PRE xx+2*aa <= k THEN
       res := aa+aa;
       xx := xx+aa+aa
    END
END