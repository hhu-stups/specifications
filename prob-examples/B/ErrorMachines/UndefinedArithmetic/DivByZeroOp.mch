MACHINE DivByZeroOp
CONSTANTS x
PROPERTIES
 x=2
VARIABLES xx
INVARIANT
 xx > xx/x
INITIALISATION xx:=x+x
OPERATIONS
  Set0(zz) = PRE zz:{1,0} THEN xx := xx mod zz END;
  Set1(yy) = PRE yy:{1,0} THEN xx:= xx / yy END;
  Set2(zz) = PRE zz:{1,0} THEN xx := xx mod zz END;
  Set4(yy) = PRE yy:{1,0} THEN xx:= xx / yy END
END

