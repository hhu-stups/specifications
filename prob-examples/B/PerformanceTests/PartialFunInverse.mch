MACHINE PartialFunInverse
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 10
CONSTANTS f
PROPERTIES
  f: 1..10 >+> 1..10 &
  f(10) = 9 &
  f(5) = 1 &
  f(9) = 6 &
  f~(2) = 2 &
  f~(3) = 3  &
  f(4) = 4   /* without this very slow to find all solutions */
/*& 1: dom(f) */
/* 
& f(6) = 8 */
  /* &
  dom(f) <: ran(f) */
ASSERTIONS dom(f) <: ran(f)
VARIABLES x
INVARIANT
 x:dom(f)
INITIALISATION x := 1
OPERATIONS
  Apply = PRE x:dom(f) THEN x:= f(x) END;
  r <-- Get = r:=x
END

