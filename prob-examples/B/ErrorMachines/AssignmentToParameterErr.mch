MACHINE AssignmentToParameterErr
DEFINITIONS SET_PREF_MAXINT == 100;
  MINLIM == MAXINT-1;
  GOAL == (numbers /= {})
VARIABLES numbers, limit
INVARIANT
 numbers <: INTEGER &  limit:NATURAL1
INITIALISATION numbers := {} || limit := 1
OPERATIONS
  StartSieve(lim) = PRE lim>MINLIM THEN
    numbers := 2..lim ||
    limit := lim
  END;
  TreatPrimeNumber(cur) = PRE numbers /= {} & cur=min(numbers) & cur>1 & cur*cur<= limit THEN
     numbers := numbers /* - ran(%n.(n:cur..limit/cur|cur*n)) */ ||
    cur := cur+1  /* ERROR <----- assignment to parameter */
  END;
  r <-- Finish(cur) = PRE numbers /= {} & cur=min(numbers) & cur*cur>limit THEN
    r := card(numbers)
  END 
END
