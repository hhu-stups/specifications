MACHINE Sieve_WithMin
DEFINITIONS SET_PREF_MAXINT == 10001;
  MINLIM == MAXINT-1;
  GOAL == (numbers /= {});
  ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:0..29 & c:1..20 & i=" "};
  ANIMATION_FUNCTION == {r,c,i|r:0..29 & c:1..20 & i=r*20+c & i:numbers}
VARIABLES numbers, limit
INVARIANT
 numbers <: INTEGER &  limit:NATURAL1
INITIALISATION numbers := {} || limit := 1
OPERATIONS
  StartSieve(lim) = PRE lim=MINLIM THEN
    numbers := 2..lim ||
    limit := lim
  END;
  TreatPrimeNumber(cur) = PRE numbers /= {} & cur=min(numbers) & cur>1 & cur*cur<= limit THEN
     numbers := (numbers - ran(%n.(n:cur..limit/cur|cur*n)) ) - {cur}  END;
  r <-- Finish(cur) = PRE numbers /= {} & cur=min(numbers) & cur*cur>limit THEN
    r := card(numbers)
  END 
END

