MACHINE MissingVarDecl
SETS
 ID={aa,bb}
VARIABLES xx,yy
INVARIANT
 xx:ID &
 /* comment */
 yy:{aa,bb} &
 yy \= xx
INITIALISATION 
  xx:=aa || yy := bb
OPERATIONS
  Set(zz) = PRE zz:ID THEN xx:= zz END;
  r <-- Get = BEGIN r := xx END
END

