/* This file contains just an initial very simple test case for
   the predicate analysis */
MACHINE basic
SETS
  A={a,b}
CONSTANTS
  aval, x, iset, y, z
PROPERTIES
    aval = {a,b}
  & x : 3 .. 5
  & iset = 0..x
  & (y |-> z) = (10 |-> x)
ASSERTIONS
  /* The predicate analysis is applied to the properties and consant above,
     the assertions are used to test the result of the analysis */
  card(aval) : 1..2;
  x : 3..5;
  card(iset) :4..6;
  y = 10;
  z : 3..5
END
