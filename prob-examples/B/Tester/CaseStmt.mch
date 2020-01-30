MACHINE CaseStmt
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
  SetxxInv(yy) = PRE yy:ID THEN 
     CASE yy OF 
       EITHER aa THEN xx := bb
       OR bb THEN xx := aa
       END
     END
  END;
  Setxx(yy) = PRE yy:ID THEN 
     CASE yy OF 
       EITHER iv THEN xx := cc /* not allowed according to Atelier B */
       OR aa THEN xx := aa
       OR bb THEN xx := bb
       END
     END
  END;
  Checkxx(yy) = PRE yy=xx THEN skip END
END
