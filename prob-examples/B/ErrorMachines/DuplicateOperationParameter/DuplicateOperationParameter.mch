MACHINE DuplicateOperationParameter
SETS
 ID={aa,bb}
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa
OPERATIONS
  Set(yy,yy) = 
    PRE yy:ID THEN xx:= yy END;
  TEST = xx := LET vv,vv BE vv=aa & vv=aa IN vv END
END

