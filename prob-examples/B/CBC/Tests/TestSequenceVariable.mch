MACHINE TestSequenceVariable
 // test that we find the error with cbc checking
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:seq(ID)
INITIALISATION xx:=[aa]
OPERATIONS
  AddErr(yy) = PRE yy:ID THEN xx := xx \/ {2|->yy} END
END

