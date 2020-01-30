MACHINE WhileLoop_v2 // merged assignments
VARIABLES sum, i, n
INVARIANT
  sum:NATURAL & i:NATURAL & n:NATURAL & i:{0,n}
INITIALISATION
  BEGIN
       BEGIN
           n,sum,i := 10000,0,0
       END;
       VAR j IN j:= 0 ;
       WHILE i<n DO
           sum := sum+i;
           i := i+1;
           j := j+1
       INVARIANT
           i:NATURAL & sum:NATURAL & sum = ((i-1) * (i))/2
       VARIANT
           n - i
       END /* ;i:=-1 */
       END
   END

OPERATIONS
   rr <-- op = rr:=sum /* avoid deadlock */
END

