MACHINE WhileLoop
VARIABLES sum, i, n
INVARIANT
 sum:NATURAL & i:NATURAL & n:NATURAL
INITIALISATION     
 BEGIN 
      BEGIN 
          n := 1000000 ;
          sum := 0 ; 
          i := 0
      END;
      WHILE i<n DO
          sum := sum + i;
           i := i+1 
      INVARIANT
          1=1 // i:NATURAL & sum:NATURAL & sum = ((i-1) * (i))/2
      VARIANT 
          n - i
      END;
      i:=-1
  END

OPERATIONS    
  rr <-- op = rr:=sum /* avoid deadlock */
END