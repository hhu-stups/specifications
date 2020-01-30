MACHINE RecursiveSCCs
DEFINITIONS
ASSERT_LTL_1 == "F {addr = 2 or addr = 3 or addr = 4}";
ASSERT_LTL_2 == "SF(C) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_3 == "(GF e(C) => GF [C]) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_4 == "SF(C) => F {addr = 4 or addr = 5}";
ASSERT_LTL_5 == "SF(E) & WF(C) => F {addr = 4 or addr = 5}";
ASSERT_LTL_6 == "(SF(C) & SF(E)) or (SF(F) & SF(E)) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_7 == "SF(C) & SF(E) or SF(F) & SF(E) & WF(F) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_8 == "(SF(F) & SF(E)) or (SF(C) & SF(D)) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_9 == "SF(E) & SF(F) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_10 == "SF(C) & SF(D) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_11 == "(GF e(E) => GF [E]) & (GF e(F) => GF [F])  => GF {addr = 4 or addr = 5}";
ASSERT_LTL_12 == "(GF e(C) => GF [C]) & (GF e(D) => GF [D])  => GF {addr = 4 or addr = 5}";
ASSERT_LTL_13 == "GF {addr = 4 or addr = 5}";
ASSERT_LTL_14 == "SF(E) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_15 == "WF(C) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_16 == "WF(E) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_17 == "SF(C) & (WF(C) & WF(E)) or WF(D) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_18 == "SF(C) & WF(D) => GF {addr = 4 or addr = 5}";
ASSERT_LTL_19 == "SF(E) & WF(D) => GF {addr = 4 or addr = 5}";

VARIABLES addr
INVARIANT
   addr : INTEGER
INITIALISATION 
 addr := -2
OPERATIONS
  A0 = PRE addr=-2 THEN addr := -1 END;
  A1 = PRE addr=-1 THEN addr := 0 END;
  A2 = PRE addr=-2 THEN addr := 3 END;
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