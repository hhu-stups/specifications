/* Bools and Strings are not annotated */
MACHINE BoolAndString
VARIABLES bT,bF,ss
INVARIANT
 bT:BOOL & bF:BOOL & ss:STRING
INITIALISATION bT,bF,ss:=TRUE,FALSE,"test"
OPERATIONS
 no_deadlock = skip
END

