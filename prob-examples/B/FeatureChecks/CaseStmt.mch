MACHINE CaseStmt
SETS
 ID={aa,bb,cc}
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa
OPERATIONS
  r <-- Get = BEGIN r:=xx END;
  cs <-- Set(yy) = PRE yy:ID THEN CASE yy OF 
     EITHER aa THEN xx,cs := cc,1
     OR     bb THEN xx,cs := aa,2
     ELSE  xx,cs := bb,3
     END END
  END
END

