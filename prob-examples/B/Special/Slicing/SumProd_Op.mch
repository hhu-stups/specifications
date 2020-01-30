MACHINE SumProd_Op
VARIABLES arr,sumv,prod,cur
INVARIANT
 arr:seq(INTEGER) &
 sumv:INTEGER & prod:INTEGER & cur:0..size(arr) &
 sumv = SIGMA(z).(z:1..cur | arr(z)) &
 prod = PI(z).(z:1..cur | arr(z))
INITIALISATION arr:=[1,2,3,4] || sumv,prod,cur := 0,1,0
OPERATIONS
  Step = PRE cur<size(arr) THEN
    sumv := sumv + arr(cur+1) ||
    prod := prod * arr(cur+1) ||
    cur := cur+1
  END;
  rs,rp <-- Result = PRE cur=size(arr) THEN rs,rp := sumv,prod END
END

