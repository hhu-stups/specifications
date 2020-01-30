MACHINE SieveAlternate
/* Alternate Defintion of computing updated numbers; in line with a TLA model */
/* TLA takes about 30 seconds to compute entire trace; ProB less than a second */
DEFINITIONS SET_PREF_MAXINT == 10000; /* SET_PREF_MAX_OPERATIONS == 2; */
  SET_PREF_MININT == -1;
  MINLIM == MAXINT-1;
  GOAL == (cur=1 & numbers /= {})
VARIABLES numbers,cur, limit
INVARIANT
 numbers <: INTEGER & cur:NATURAL1 & limit:NATURAL1
INITIALISATION numbers := {} || cur := 1 || limit := 1
OPERATIONS
  StartSieve(lim) = PRE cur=1 & lim>MINLIM THEN
    numbers := 2..lim ||
    cur := 2 ||
    limit := lim
  END;
  prime <-- TreatNumber(cc) = PRE cc=cur & cur>1 & cur*cur<= limit THEN
    IF cc:numbers THEN
       numbers := {n|n:numbers & n mod cur /= 0} \/ {cur}  /* alternate definition here */
      || prime := TRUE
    ELSE
       prime := FALSE
    END ||
    cur := cur+1
  END;
  r <-- Finish = PRE cur*cur>limit THEN
    cur := 1 || r := card(numbers)
  END
END

