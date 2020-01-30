MACHINE BinSearchOps
SETS Status = {found,continue,not_found}
CONSTANTS arr,n
PROPERTIES
  arr : 1..n --> INTEGER
VARIABLES i,j
INVARIANT
  1 <= i & i <= j & j <=n
INITIALISATION i:=1 || j:= n
OPERATIONS
  res <-- Search(o) = PRE o:INTEGER THEN
    LET k BE k=(i+j)/2 IN
     IF arr(k)=o THEN
        res := found
     ELSIF i=j THEN
        res := not_found
     ELSIF arr(k) > o THEN
        j := k-1 || res := continue
     ELSE
        i := k+1 || res := continue
     END
   END
 END
END

