MACHINE InvalidAssignmentOpCall
INCLUDES Submachine1
VARIABLES xx
INVARIANT xx : INTEGER
INITIALISATION xx := 0
OPERATIONS
     op(arg) = PRE arg:INTEGER THEN arg <-- op1 END
END
