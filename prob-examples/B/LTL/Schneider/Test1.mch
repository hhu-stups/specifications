MACHINE   Test1
CSP_CONTROLLER Test3
DEFINITIONS
 ASSERT_LTL1 == "G(not(e(down)))";
 ASSERT_LTL2 == "G(not(e(up)))";
 ASSERT_LTL3 == "G(not(e(opa)))"
VARIABLES  nn
INVARIANT  nn : 0..1
INITIALISATION  nn := 0
OPERATIONS
  up = PRE nn = 0
       THEN nn := 1
       END;

  down = PRE nn = 1
         THEN nn := 0
         END

END