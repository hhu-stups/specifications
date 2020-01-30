MACHINE M1_err
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION 
  xx:=
, /* syntax error here */
 iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

