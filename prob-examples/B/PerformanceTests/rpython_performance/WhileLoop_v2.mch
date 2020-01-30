MACHINE WhileLoop_v2 // merged assignments
VARIABLES sum, i, n
INVARIANT
  sum:NATURAL & i:NATURAL & n:NATURAL & i:{0,n}
INITIALISATION
  BEGIN
       BEGIN
           n,sum,i := 1000000,0,0
       END;
       WHILE i<n DO
           sum,i := sum + i,i+1
       INVARIANT
           i:NATURAL & sum:NATURAL & sum = ((i-1) * (i))/2
       VARIANT
           n - i
       END /* ;i:=-1 */
   END

OPERATIONS
   rr <-- op = rr:=sum /* avoid deadlock */
END

