MACHINE setext_dombug
/* Regression test for a bug where the interval information was not propagated correctly */
SETS
  A={a,b,c}
CONSTANTS
  aval,e
PROPERTIES
  aval = {a|->0,b|->3} &
  e : ran(aval)
ASSERTIONS
  e : 0..3;
  card(aval) : 1..2
END
