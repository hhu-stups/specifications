MACHINE RecordWithString
CONSTANTS r
PROPERTIES r = rec("a": 1) 
VARIABLES x
INVARIANT x:INTEGER
INITIALISATION x := 1
/* OPERATIONS
  Try = BEGIN x := x'"a" END */
END

