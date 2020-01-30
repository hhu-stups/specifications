MACHINE CaseStmt_Illegal1
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
       // EITHER iv THEN xx := cc /* not allowed according to Atelier B */
       EITHER aa THEN xx := aa
       OR bb THEN xx := bb
       OR bb THEN xx := aa   // Duplicate Case Error: (line 24, column 10)
       ELSE xx:= bb
       END
     END
  END;
  Checkxx(yy) = PRE yy=xx THEN skip END
END
