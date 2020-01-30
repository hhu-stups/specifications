MACHINE FailingInit1
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx, yy
INVARIANT
 xx:ID & yy:ID
INITIALISATION xx:=iv || yy :: {}
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

