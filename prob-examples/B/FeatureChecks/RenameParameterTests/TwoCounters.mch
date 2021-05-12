MODEL
   TwoCounters
INCLUDES c1.Counter, c2.Counter
INVARIANT c1.cnt >= c2.cnt
OPERATIONS
  up = BEGIN c1.inc || c2.inc END;
  up1 = c1.inc;
  r1,r2 <-- getcnt = BEGIN r1,r2 := c1.cnt,c2.cnt END
END