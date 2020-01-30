MACHINE LTL_1State
DEFINITIONS
  ASSERT_LTL1 == "G{x=0}";
  ASSERT_LTL2 == "F{x=0}";
  ASSERT_LTL3 == "GF{x=0}";
  ASSERT_LTL4 == "FG{x=0}";
  ASSERT_LTL5 == "G[Loop]";
  ASSERT_LTL6 == "G not(e(Disabled))";
  ASSERT_LTL7 == "G([Loop] => {x=0})";
  ASSERT_LTL8 == "G([Loop] => X{x=0})";
  ASSERT_LTL9 == "G([Loop] => XX{x=0})";
  ASSERT_LTL10 == "G([Loop] => XXX{x=0})";
  ASSERT_LTL11 == "G([Disabled] => {1=0})";
  ASSERT_LTL12 == "F G([Loop] => X(G([Loop] => X{x=0})))"
VARIABLES x
INVARIANT x:NATURAL
INITIALISATION x:=0
OPERATIONS
  Loop = BEGIN x:= 0 END;
  Disabled = PRE x<0 THEN skip END
END

