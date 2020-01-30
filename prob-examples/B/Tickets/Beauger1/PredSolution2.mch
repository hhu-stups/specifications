MACHINE PredSolution2
/* Another solution to the problem; constructing the composition using a lambda abstraction */
/* Advantage: we can now also get the domain, range, ... of f_x */
DEFINITIONS
SET_PREF_MININT == -2147483647;
SET_PREF_MAXINT == 2147483647

CONCRETE_CONSTANTS
t_x,
f_x

PROPERTIES
t_x = 1..256 &
f_x = %x.(x:dom(id(t_x))|pred(id(t_x)(x)))

ASSERTIONS
 t_x=t_x;
  f_x(256) = 255; /* this works */
  ran(f_x) = 0..255; /* this also works */
  card(closure1(f_x)) = 32896 /* also works, but takes a bit longer */
END