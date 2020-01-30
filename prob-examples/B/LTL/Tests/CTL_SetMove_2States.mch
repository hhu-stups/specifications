MACHINE CTL_SetMove_2States
DEFINITIONS
  ASSERT_CTL1 == "EX[Move]true";
  ASSERT_CTL2 == "AG(EX{xx=bb})";
  ASSERT_CTL3 == "EX[Move]EX[Move]EX[Move]EX[Move]true";
  ASSERT_CTL4 == "AGEFEX[Move]true";
  ASSERT_CTL5 == "AGEFEX[Set(aa)]{xx=aa}";
  ASSERT_CTL6 == "not(EF EX[Set(aa)]{xx=bb})";
  ASSERT_CTL7 == "EF EG {xx=bb}";
  ASSERT_CLT8 == "{xx=bb} => EG {xx=bb}"
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  Move = PRE xx=aa THEN skip END
END

