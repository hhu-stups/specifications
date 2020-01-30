MACHINE BecomeElementDeadlockTest
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set = BEGIN xx:: (ID \ ({xx} \/ {iv})) END
END

