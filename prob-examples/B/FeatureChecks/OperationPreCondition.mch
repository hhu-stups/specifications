MACHINE OperationPreCondition
/* Simple Machine to test Debug Operation PRE and Visualize Operation PRE */
SETS
 ID={aa,bb}
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx : (xx:ID & xx /= yy) END;
  Set2(yy) = PRE yy:ID THEN xx : (xx:ID & xx /= yy & xx=yy) END;
  Set20(yy) = PRE yy:ID THEN xx : (xx:ID & xx /= xx$0 & xx=yy & xx/=bb) END;
  Set3(yy) = PRE yy:ID THEN xx :: ID - {yy,bb} END
END

