MACHINE CardProp
DEFINITIONS
 SET_PREF_MAXINT == 20;
 SET_PREF_CLPFD == TRUE
CONSTANTS s
PROPERTIES
 card(s) < 5 &
 1:s & 2:s & 3:s & (( 4:s &  5:s) or 6:s)
OPERATIONS
 r <-- GETs = BEGIN r:= s END
END

