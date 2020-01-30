MACHINE RecursiveSCCs3
DEFINITIONS
ASSERT_LTL_1 == "F { addr = 8}";
ASSERT_LTL_2 == "SF(E) & SF(D) => F { addr = 8}";
ASSERT_LTL_3 == "SEF => F { addr = 8}";
ASSERT_LTL_4 == "SF(B) & SF(G) & SF(E) & SF(D) => F { addr = 8}";

VARIABLES addr
INVARIANT
   addr : INTEGER
INITIALISATION 
 addr := 0
OPERATIONS
  A = SELECT addr :{0,1,2} THEN addr := addr+1
      WHEN addr = 3 THEN addr := 4 
      WHEN addr = 4 THEN addr := 5 
      WHEN addr = 5 THEN addr := 6 
      WHEN addr = 6 THEN addr := 5 
      WHEN addr = 7 THEN addr :: {2,3} 
      END;
  B = SELECT addr = 6 THEN skip 
      END;
  C = SELECT addr = 7 THEN addr := 8
      WHEN addr = 8 THEN skip
      END; 
  D = SELECT addr = 6 THEN addr := 3 
      END;
  E = SELECT addr = 6 THEN addr := 7
      END;
  G = SELECT addr = 6 THEN skip
      END
END

