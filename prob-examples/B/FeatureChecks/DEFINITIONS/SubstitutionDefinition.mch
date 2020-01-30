MACHINE SubstitutionDefinition
SETS
 ID={aa,bb}
VARIABLES xx,yy
INVARIANT
   xx:ID & yy:ID
DEFINITIONS
   Body == BEGIN xx := aa || yy := bb END
INITIALISATION xx:=bb || yy := bb
OPERATIONS
  Set(y1) = PRE y1:ID THEN xx:= y1 END;
  Reset = PRE xx /= aa THEN Body END
END

