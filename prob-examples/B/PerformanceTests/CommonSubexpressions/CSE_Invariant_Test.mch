MACHINE CSE_Invariant_Test
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
  xx:ID &
  xx /= bb &
  xx : ({aa,bb} \ {aa,bb}) \/ ({aa,bb}) &
  xx : {aa,bb} &
  xx : {bb,aa}
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

