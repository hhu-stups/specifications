MACHINE HygMakroTest
DEFINITIONS
   egt(x) == (#y.(y:NAT1 & y<100 & x<y))  /* test whether alpha renaming is performed within macros */
VARIABLES
   y
INVARIANT
   y:INTEGER & egt(y)
INITIALISATION
   y:= 5
END