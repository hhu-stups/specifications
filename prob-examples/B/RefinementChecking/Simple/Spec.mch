MACHINE Spec
SETS
 ID={aa,bb,cc}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  SetNot(yy) = PRE yy: ID THEN xx :: ID-{yy} END;
  r <-- Getxx = BEGIN r := xx END
END

