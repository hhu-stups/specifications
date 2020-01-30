MACHINE NatRangeParsingTest
SETS ID = {a,b}
CONSTANTS i
PROPERTIES
 i:INTEGER & 
 i: -2..2   /* just test whether this is correctly parsed */
  & i>-1
VARIABLES x
INVARIANT
 x:seq(ID) & i:0..size(x)
INITIALISATION x := [a,b,b]
END

