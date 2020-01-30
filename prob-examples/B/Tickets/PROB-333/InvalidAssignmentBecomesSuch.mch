MACHINE InvalidAssignmentBecomesSuch
VARIABLES xx
INVARIANT xx : INTEGER
INITIALISATION xx := 0
OPERATIONS
     set1(arg) = PRE arg:INTEGER THEN arg : (arg=1) END
END
