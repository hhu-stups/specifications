MACHINE Sieve
DEFINITIONS SET_PREF_MAXINT == 10000; /* SET_PREF_MAX_OPERATIONS == 2; */
  SET_PREF_MININT == -1;
  MINLIM == MAXINT-1;
  GOAL == (cur=1 & numbers /= {})
/* Note, pi(n) = number of primes less than n : (return parameter of Finish below)
1000 -> 168; 2000 -> 303; 5000 -> 669; 10000 -> 1229; 20000 -> 2262; 50000 -> 5133;
100000 -> 9592; 200000 -> 17984 */
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
       numbers := numbers - ran(%n.(n:cur..limit/cur|cur*n))
/*        numbers := numbers - ran(%n.(n:2..limit/cur|cur*n)) */
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

