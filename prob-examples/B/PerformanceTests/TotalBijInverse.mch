MACHINE TotalBijInverse
DEFINITIONS
 SET_PREF_MAXINT == 10
CONSTANTS f
PROPERTIES
  f: NATURAL +-> NATURAL &
  f(10) = 9 &
  f(5) = 1 &
  f(9) = 6 &
  f~(2) = 2 &
  f~(3) = 3  &
  f(4) = 4   /* without this very slow to find all solutions */
& f(6) = 8 &
  f(1) = 10 &
  f: 1..10 >->> 1..10 
/* &
  f(8) = 5 */
&
  dom(f) <: ran(f) 
ASSERTIONS dom(f) <: ran(f)
VARIABLES x
INVARIANT
 x:dom(f)
INITIALISATION x := 1
OPERATIONS
  Apply = x:= f(x);
  r <-- Get = r:=x
END
