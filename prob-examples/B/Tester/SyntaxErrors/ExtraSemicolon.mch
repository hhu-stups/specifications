MACHINE ExtraSemicolon
SETS
 ID={aa,bb}
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  r <-- Get = BEGIN r := xx END;
END

