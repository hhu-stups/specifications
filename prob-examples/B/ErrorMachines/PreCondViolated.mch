MACHINE PreCondViolated
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
  Set(yy) = PRE yy:ID THEN
             IF yy=iv THEN xx:= iv ELSE
               PRE yy=iv THEN xx:= yy END
             END
  END
END

