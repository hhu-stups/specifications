MACHINE CaseStmt_v2
SETS
 ID={aa,bb,cc,dd}
CONSTANTS iv
PROPERTIES
 iv:ID & iv=cc
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  SetxxInv(yy) = PRE yy:ID THEN 
     CASE yy OF 
       EITHER aa THEN xx := bb
       OR bb THEN xx := aa
       END
     END
  END;
  Setxx(yy) = PRE yy:ID THEN 
     CASE yy OF
       EITHER aa THEN xx := aa
       OR bb, cc THEN xx := bb  // Note: duplicate values allowed
       ELSE xx:= bb
       END
     END
  END;
  Checkxx(yy) = PRE yy=xx THEN skip END
END
