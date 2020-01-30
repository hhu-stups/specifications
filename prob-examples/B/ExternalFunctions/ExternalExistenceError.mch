MACHINE ExternalExistenceError
/* Check that existence errors reported for external functions */
SETS
 ID={aa,bb}
DEFINITIONS
 EXTERNAL_FUNCTION_TEST == (INTEGER --> INTEGER);
 TEST(x) == x
ASSERTIONS
 TEST(100) = 100 /* should raise error */
VARIABLES xx
INVARIANT
 xx <: ID 
INITIALISATION xx:=ID
OPERATIONS
  Test = PRE TEST(20)=20  /* should also raise error */
  THEN skip END
END

