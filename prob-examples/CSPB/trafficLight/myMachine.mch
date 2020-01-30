/* CSP should be able to retrieve values of variables using the
   construct variableName?VALUE, did not work initially but does work now */
 
MACHINE trafficLight
/* CSP_CONTROLLER trafficLight_Guide_VARIABLE */
CONSTANTS d
PROPERTIES
 d:NAT &
 d>0
VARIABLES nn
INVARIANT
 nn:NAT &
 nn<=d
INITIALISATION nn:=0
OPERATIONS

nv <-- getnn = nv:=nn;

ML_out=
  PRE
   nn<d
  THEN
  nn:=nn+1 
  END;

 aa <-- getMax=
  aa:=d;

 bb <-- getCars=
  bb:=nn;

 ML_in=
  PRE
   0<nn
  THEN
   nn:=nn-1 
  END
END

