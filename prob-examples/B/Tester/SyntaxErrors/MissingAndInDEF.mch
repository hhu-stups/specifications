MACHINE MissingAndInDEF
SETS
 ID={aa,bb}
DEFINITIONS INV ==
 (
 xx:ID 
 /* comment */
  xx:{aa,bb})
VARIABLES xx
INVARIANT
  INV
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  r <-- Get = BEGIN r := xx END
END

