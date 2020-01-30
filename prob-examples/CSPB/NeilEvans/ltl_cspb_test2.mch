MACHINE ltl_cspb_test2
SETS  S = {s1,s2,s3,s4}
DEFINITIONS
  ASSERT_LTL == "X(e(a))"
VARIABLES s
INVARIANT s<: S

INITIALISATION
  s:= {}
OPERATIONS
  a = s:: POW(S-{s3,s4});
  b = s:: POW(S-{s1,s2})
END