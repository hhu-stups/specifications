MACHINE CXCC2
 INCLUDES Ether 
DEFINITIONS
  FT_TYPE == from:NODES & to:NODES & from/=to
VARIABLES aroutes 
INVARIANT aroutes: POW(iseq1(NODES))
INITIALISATION
  aroutes := {}
OPERATIONS 
  initializeConnection(from,to) = PRE FT_TYPE &  !(r).(r:aroutes => (first(r)=from => last(r)/=to))  THEN skip END

END