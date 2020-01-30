MACHINE PartialSurjTest
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 10
CONSTANTS f
PROPERTIES
  f: 2..6 +->> 3..4 
  /* (2:dom(f) => f(2)<=2) &
  (3:dom(f) => f(3)<=3) & 
  (4:dom(f) => f(4)<=4) */
  & 
  !x.(x:dom(f) => f(x) <= x) &
  dom(f) <: ran(f)
VARIABLES x
INVARIANT
 x:dom(f)
INITIALISATION x := 3
OPERATIONS
  Apply = x:= f(x);
  r <-- Get = r:=x
END

