MACHINE FailingInit4
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx,yy
INVARIANT
 xx:ID & yy:ID
INITIALISATION xx,yy:(xx:ID & yy:ID & xx /= iv & yy /= iv & xx /= yy)
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

