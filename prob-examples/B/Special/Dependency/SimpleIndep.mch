MACHINE SimpleIndep
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx,zz
INVARIANT
 xx:ID & zz:ID
INITIALISATION xx:=iv || zz := iv
OPERATIONS
  SetXX(yy) = PRE yy:ID THEN xx:= yy END;
  SetZZ(yy) = PRE yy:ID THEN zz:= yy END
END

