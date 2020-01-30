MACHINE EnumerationSpeed
DEFINITIONS
 SET_PREF_MAXINT == 100;
 SET_PREF_MININT == -1
VARIABLES x
INVARIANT
 x <: INT
INITIALISATION x:={}
OPERATIONS
  SetMaxCard = x : (x<:INT & card(x)=MAXINT+2);   /* in principle 2^102 combinations !! */
  c <-- GetCard = c:= card(x)
END

