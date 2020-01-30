MODEL
   FourCounters
INCLUDES t1.TwoCounters, t2.TwoCounters
/* PROMOTES t1.up */
INVARIANT
  t1.c1.cnt = t1.c2.cnt &
  t2.c1.cnt = t2.c2.cnt &
  t1.c1.cnt >= t2.c2.cnt
OPERATIONS
  fup = BEGIN t1.up || t2.up END;
  fup1 = t1.up; /*   The PO generator of B4Free does not seem to support t1.c1.X ?? */
  r1,r2,r3,r4 <-- getfcnt = BEGIN r1,r2,r3,r4 := t1.c1.cnt,t1.c2.cnt,t2.c1.cnt,t2.c2.cnt END
END