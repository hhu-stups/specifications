MACHINE EnumerstionSpeed3
DEFINITIONS
 SET_PREF_MAXINT == 6;  /* time out with 3.5 seconds at 7 */
 SET_PREF_MININT == 0
VARIABLES x
INVARIANT
 x <: INT
INITIALISATION x:={}
OPERATIONS
  SetMaxCard = x : (x<:INT & card(x):x & card(x)*card(x):x);   /* really 2^(MAXINT+1) combinations !! */
  c <-- GetCard = c:= card(x);
  e <-- GetEl = e::x
END
