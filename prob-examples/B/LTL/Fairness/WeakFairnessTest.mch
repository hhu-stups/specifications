MACHINE WeakFairnessTest
DEFINITIONS
ASSERT_LTL_1 == "WF(Back) => not GF {addr = 3}";
ASSERT_LTL_2 == "SF(Back) => not GF {addr = 3}";
ASSERT_LTL_3 == "WF(B) => not GF {addr = 2}";

VARIABLES addr
INVARIANT
   addr : INTEGER
INITIALISATION 
 addr := -1
OPERATIONS
  A = PRE addr=-1 THEN addr := 0 END;
  B = PRE addr=0 or addr = 1 or addr = 2 THEN addr := 3 END;
  B1 = PRE addr = 1 or addr = 2 THEN addr := 3 END;  
  C = PRE addr = 0 THEN addr := 1 END;
  D = PRE addr = 1 THEN addr := 2 END;
  E = PRE addr = 2 THEN addr := 0 END;
  Loop = PRE addr=3 THEN skip END;
  Back = PRE addr=3 THEN addr := 10 END
END