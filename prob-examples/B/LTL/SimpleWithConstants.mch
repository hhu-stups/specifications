MACHINE SimpleWithConstants
DEFINITIONS
 ASSERT_LTL0 == "GF {xx=s4}";
 ASSERT_LTL1 == "[TransA]";
 ASSERT_LTL2 == "G([TransB] => X [TransC])"
SETS
 ID={s1,s2,s3,s4}
CONSTANTS iv
PROPERTIES
 iv:ID & iv=s1
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  TransA = PRE xx=iv THEN xx := s2 END;
  TransB = PRE xx=s2 THEN xx := s3 END;
  TransC = PRE xx=s3 or xx=s4 THEN xx := s4 END;
  TransD = PRE xx=s4 THEN xx := s4 END
END

