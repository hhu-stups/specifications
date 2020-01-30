MACHINE FailingInit5
SETS
 ID={aa,bb}
VARIABLES xx,yy
INVARIANT
 xx:ID & yy:ID
INITIALISATION xx,yy:(xx:ID & yy:ID & xx /= aa & yy /= aa & xx /= yy )
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

