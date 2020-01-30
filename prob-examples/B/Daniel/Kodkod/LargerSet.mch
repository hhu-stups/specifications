MACHINE LargerSet
/* simple check to see how Kodkod deals with larger sets */
CONSTANTS n,set1,set2
PROPERTIES
  n = 17 &
  set1 = {x|x:0..(2**n) & x mod 2 = 0} &  /* Kodkod fail */
  set2 = (0..2**n) - set1   /* Kodkod fail */
/* Runtime
n   ProB       Kodkod
10  0.02 sec
15  0.42 sec
16  0.84 sec
17  1.69 sec 
*/
INVARIANT
  set2 = {x|x:0..(2**n) & x mod 2 = 1}
ASSERTIONS
  set2 = {x|x:0..(2**n) & x mod 2 = 1}
END

