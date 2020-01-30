MACHINE TestPastLTL
DEFINITIONS
 ASSERT_LTL_1 == "G O {xx=aa}";
 ASSERT_LTL_2 == "G({xx=cc} => ({xx=cc} S {xx=bb}))";
 ASSERT_LTL_3 == "G({xx=cc} => Y ({xx=bb} S {xx=aa}))";
 ASSERT_LTL_4 == "G({xx=cc} => Y ({xx=bb} S [GoB]))";
SETS
 ID={aa,bb,cc}
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa
OPERATIONS
  GoB = PRE xx=aa or xx=bb THEN xx:=bb END;
  GoA = PRE xx=bb or xx=cc THEN xx:=aa END;
  GoC = PRE xx=bb THEN xx:=cc END
END

