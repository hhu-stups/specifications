MACHINE TestRecordInference
SETS
 BBREC; BBREC2
CONSTANTS make, demake2
PROPERTIES
 make : BOOL * BOOL >->> BBREC &
 demake2: BBREC2 >->> BOOL*BOOL  /* was not recognised as record, but is now ! */
VARIABLES xx,yy
INVARIANT
 xx:BBREC & yy:BBREC2
INITIALISATION xx:= make(TRUE,TRUE) || yy:= demake2~(FALSE,TRUE)
OPERATIONS
  a,b <-- Get = BEGIN a,b:= TRUE,FALSE END
END

