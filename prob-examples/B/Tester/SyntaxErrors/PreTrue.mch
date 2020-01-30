MACHINE ExtraAnd
SETS
 ID={aa,bb}
VARIABLES xx
INVARIANT
 xx:ID 
 /* comment */
 & xx:{aa,bb}
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  r <-- Get = PRE true THEN r := xx END
END

