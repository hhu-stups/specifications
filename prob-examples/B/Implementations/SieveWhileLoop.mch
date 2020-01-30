MACHINE SieveWhileLoop
VARIABLES numbers,cur, limit
INVARIANT
 numbers <: INTEGER & cur:NATURAL1 & limit:NATURAL1
INITIALISATION numbers := 2..100000 || cur := 2 || limit := 100000
OPERATIONS
 // for 10000 we expect res=9592
  res <-- ComputeNumberOfPrimes = 
         BEGIN
          WHILE cur>1 & cur*cur<= limit DO 
		IF cur:numbers THEN
		   numbers := numbers - ran(%n.(n:cur..limit/cur|cur*n))
		END;
		cur := cur+1
		INVARIANT cur : 2..limit
		VARIANT limit-cur
	  END;
	  res := card(numbers)
	END
END

