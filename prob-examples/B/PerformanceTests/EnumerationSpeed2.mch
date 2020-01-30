MACHINE EnumerationSpeed2
DEFINITIONS
 SET_PREF_MAXINT == 12;  /* time out with 3.5 seconds at 13 */
 SET_PREF_MININT == 0
VARIABLES x
INVARIANT
 x <: INT
INITIALISATION x:={}
OPERATIONS
  SetMaxCard = x : (x<:INT & SIGMA(z).(z:x|z) = MAXINT*(MAXINT+1)/2);   /* really 2^(MAXINT+1) combinations !! */
  c <-- GetCard = c:= card(x)
END

