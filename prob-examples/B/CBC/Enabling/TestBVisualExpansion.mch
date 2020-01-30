MACHINE TestBVisualExpansion
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
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  Set2(yy) = PRE yy:{aa} \ {xx} & yy /= iv THEN xx := yy END
END

