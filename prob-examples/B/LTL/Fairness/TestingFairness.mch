MACHINE TestingFairness
DEFINITIONS

ASSERT_LTL_1 == "SF(C) & SF(D) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_2 == "SF(E) & SF(F) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_3 == "SF(E) & SF(D) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_4 == "WF(C) & WF(D) => GF {addr /= 4 & addr /= 3}";
ASSERT_LTL_5 == "SF(E) & WF(D) => GF {addr = 4 or addr = 5}"

VARIABLES addr
INVARIANT
   addr : NATURAL
INITIALISATION 
 addr := 0
OPERATIONS
  A = PRE addr=0 or addr = 2 THEN addr := addr+1 END;
  B = PRE addr = 1 THEN addr := addr+1 END;
  C = PRE addr = 1 or addr = 4 THEN IF addr = 1 THEN addr := addr+3 
	ELSE addr := addr -2 END END;
  D = PRE addr = 3 THEN addr := 0 END;
  E = PRE addr = 2 THEN addr := addr+3 END;
  F = PRE addr = 3 THEN addr := addr-1 END;
  G = PRE addr = 3 THEN skip END;
  L = PRE addr = 4 or addr = 5 THEN addr := addr END
END