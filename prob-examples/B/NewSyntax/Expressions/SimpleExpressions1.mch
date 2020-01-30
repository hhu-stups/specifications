MACHINE SimpleExpressions1
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
EXPRESSIONS
  mcd == card(ID);
  mcd1 == mcd+1
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

