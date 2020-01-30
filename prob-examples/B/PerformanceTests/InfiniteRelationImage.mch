MACHINE InfiniteRelationImage
/* check that an infinite relation works with relational image */
DEFINITIONS
  SET_PREF_CLPFD == TRUE
CONSTANTS divisors, perfect
PROPERTIES
 divisors = (/*@ symbolic */ {x,d| x:NATURAL & d:NATURAL1 & d<x & x mod d = 0}) &

 perfect : 7..50 & SIGMA(x).(x:divisors[{perfect}]|x) = perfect
ASSERTIONS
  perfect = 28; /* the only perfect number between 7 and 50 is 28 */
 /* for some reason this leads to expansion in ASSERTIONS :
  divisors[{6}] = {1,2,3};
  divisors[{100}] = {1,2,4,5,10,20,25,50};
*/
  divisors[{3,6}] = {1,2,3};
  divisors[{0,100}] = {1,2,4,5,10,20,25,50};
  SIGMA(x).(x:{1,2,3,6}|x) = 12;
  SIGMA(x).(x:{1,2,3}|x) = 6;
  /* a few more perfect numbers : */
  SIGMA(x).(x:divisors[{6}]|x) = 6;
  SIGMA(x).(x:divisors[{28}]|x) = 28;
  SIGMA(x).(x:divisors[{496}]|x) = 496;
  {pf| pf:8127..8129 & SIGMA(x).(x:divisors[{pf}]|x) = pf} = {8128}
END
