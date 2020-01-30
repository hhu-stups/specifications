MACHINE UnsatTotFunRange
/* A test to check how easy it is to detect that a certain value cannot appear in the range */
/* A simpler manifestation of a problem that appears in the Sorting benchmarks */
/* ProB does setup constraints for the range values, but this info seems to get lost
   in the ran(f) computation ;
  Kodkod fails to translate */
CONSTANTS f,x,n
PROPERTIES
 n = 10 &
 f: 1..n --> 1..n &
 x : ran(f)  & x<100 &
 x>n /* Note: this is detected inconsistent straight away: f(n)>n */
END

