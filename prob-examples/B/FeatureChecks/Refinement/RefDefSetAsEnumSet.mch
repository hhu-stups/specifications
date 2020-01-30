REFINEMENT RefDefSetAsEnumSet
/* Check if we can instantiate deferred sets (in DefSet) in a refinement */
REFINES DefSet
/* SETS TRAINS = {t1,t2} */
/*
DEFINITIONS
 ALLDIFF1(s) == !(i,j).(i:dom(s) & j:dom(s) & i<j => s(i) /= s(j)) */ /* ALDIFF2([t1,t2]) */
CONSTANTS
 s1,s2, t1,t2,t3, t4, t5, t6
PROPERTIES
 SIGNALS = {s1,s2} & s1 /= s2 &
 TRAINS = {t1,t2,t3,t4,t5,t6} & 6 = card({t1,t2,t3,t4,t5,t6})
ASSERTIONS
  t1 /= t2;
  t1 /= t3;
  t1 /= t4;
  t1 /= t5;
  t1 /= t6;
  t2 /= t3;
  t2 /= t4;
  t3 /= t4
END

