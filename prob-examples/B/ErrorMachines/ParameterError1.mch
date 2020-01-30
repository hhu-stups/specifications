MACHINE ParameterError1(PAR)
CONSTRAINTS
 card(PAR)>3
CONSTANTS x
PROPERTIES
 x:PAR /* not allowed to use PAR in PROPERTIES */
OPERATIONS
  r <-- EqX(y) = PRE y:PAR THEN 
         r := bool(x=y)
   END
END