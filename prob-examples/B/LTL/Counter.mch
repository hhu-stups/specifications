MACHINE Counter
DEFINITIONS
  ASSERT_LTL1 == "GF([Reset])";
  ASSERT_LTL2 == "G({xx=n} => X{xx=i})";
  ASSERT_CTL1 == "AG( EF {xx=i} )";
  ASSERT_CTL2 == "AG( EF e(Reset) )";
  ASSERT_CTL3 == "EG (e(Inc) or {xx=n})";
  ASSERT_CTL4 == "not(EG(e(Inc)))";
  ASSERT_CTL5 == "AF( e(Reset))";
  ASSERT_CTL6 == "AG( AF {xx=i} )"
CONSTANTS i,n
PROPERTIES
 i=1 & n = 10
VARIABLES xx
INVARIANT
 xx:1..n
INITIALISATION xx:=i
OPERATIONS
  Inc = PRE xx<n THEN xx:= xx+1 END;
  Reset = PRE xx=n THEN xx:= i END
END

