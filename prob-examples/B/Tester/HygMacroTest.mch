MODEL
   HygMacroTest
DEFINITIONS
   egt(x) == (#y.(y:NATURAL1 & y<100 & x<y));
   egt2(x) == (#yy.(yy:NATURAL1 & yy<100 & x<yy))
VARIABLES
   y
INVARIANT
   y:INTEGER & egt(y+1) /* is false ! */
ASSERTIONS
  egt2(y+1) /* is true */
INITIALISATION
   y:= 5
END