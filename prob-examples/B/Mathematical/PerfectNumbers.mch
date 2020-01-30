MACHINE PerfectNumbers
DEFINITIONS
 is_divisor_of(y,x) == (y:1..x/2 & x mod y = 0);
 is_perfect(x) == (x = SIGMA(y).(is_divisor_of(y,x)|y))
CONSTANTS perfect, maxp
PROPERTIES
  maxp = 1000 &
  perfect = {n|n:1..maxp & is_perfect(n)}
ASSERTIONS
  1..5 /\ perfect = {};
  6 : perfect;
  7..27 /\ perfect = {};
  28: perfect;
  29..495 /\ perfect = {};
  is_perfect(8128)
  /* is_perfect(33550336) */
  /* see http://en.wikipedia.org/wiki/Perfect_number */
END

