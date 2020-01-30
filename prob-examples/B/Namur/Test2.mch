MACHINE Test2

VARIABLES xx, pc
INVARIANT
 xx:NATURAL & pc : 0..2
INITIALISATION xx:=0 || pc := 0
OPERATIONS
  OperationA = SELECT pc=0 THEN xx := 1 || pc := 1 END;
  OperationB = SELECT pc=1 THEN xx := 2 || pc := 2 END
END

