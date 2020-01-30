MODEL
   HygMacroTest
DEFINITIONS
   egt(x) == (#y.(y:NAT1 & y<100 & x<y))
VARIABLES
   y
INVARIANT
   y:INTEGER & egt(y+1)
INITIALISATION
   y:= 5
END