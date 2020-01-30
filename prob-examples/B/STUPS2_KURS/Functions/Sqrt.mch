MACHINE Sqrt
DEFINITIONS
   SET_PREF_MAXINT == 4
CONSTANTS
 f
PROPERTIES
 f: NAT --> NAT & !x.(x:NAT => (f(x)*f(x)<=x & (f(x)+1)*(f(x)+1) > x) )
VARIABLES x
INVARIANT
   x:NAT
INITIALISATION x:= MAXINT
OPERATIONS
  root = x := f(x)
END