MACHINE Sieve
VARIABLES numbers,cur, limit
INVARIANT
 numbers <: INTEGER & cur:NATURAL1 & limit:NATURAL1
INITIALISATION numbers := 2..10000; cur := 2; limit := 10000
OPERATIONS
 // for 10000 we expect res=9592
  res <-- ComputeNumberOfPrimes =
    BEGIN
      WHILE cur>1 & cur*cur<= limit
      DO
        IF cur:numbers
        THEN
          //numbers :=  ran(%n.(n:cur..limit/cur|cur*n))
          VAR n, set
          IN
            n:= cur;
            set := {};
            WHILE n <= limit/cur
            DO
              set := set \/ {cur * n};
              n := n + 1
            INVARIANT 1=1
            VARIANT limit/cur - n
            END;
            numbers := numbers - set
          END//VAR
        END;
        cur := cur+1
      INVARIANT cur : 2..limit
      VARIANT limit-cur
      END; //WHILE
      res := card(numbers)
    END//BEGIN
END
