MACHINE dfcheck_houseset
/* checks whether depth-first mode works properly */
/* in depth-first mode the model checker should find a counter example straightaway */
DEFINITIONS SET_PREF_MAXINT == 80; SET_PREF_MININT == -1
CONSTANTS maxhs
PROPERTIES maxhs : NAT1 & maxhs = 75
VARIABLES hs
INVARIANT
 hs <: NAT1 & card(hs) <= maxhs
INITIALISATION hs:={}
OPERATIONS
  Add(h) = PRE h:NAT1 & h /: hs THEN 
                     hs:= hs \/ {h}
                 END
END

