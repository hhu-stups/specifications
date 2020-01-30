MACHINE InitTriesToAssignConstant
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv || iv:=aa
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

