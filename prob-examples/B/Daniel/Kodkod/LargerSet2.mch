MACHINE LargerSet2
/* simple check to see how Kodkod deals with larger sets */
CONSTANTS n,set1,set2
PROPERTIES
  n = 1000 &
  set1 = (0..n/2) \/ {n} &  /* Kodkod fail */
  set2 = (0..n) - set1    /* Kodkod fail */
/* Runtime
n   ProB         Kodkod
1000   0.01 sec
10000  0.05 sec
100000 0.67 sec
*/
INVARIANT
  set1 \/ set2 = (0..n)
ASSERTIONS
  set1 \/ set2 = (0..n)
END

