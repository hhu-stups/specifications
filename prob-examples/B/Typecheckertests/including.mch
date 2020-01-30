MACHINE including
DEFINITIONS
  TEST_localvar == "abstract_variables/vAa: global(sA)";
  TEST_inc1avar == "abstract_variables/vI1: global(seenset2)";
  TEST_inc1bvar == "abstract_variables/'r.vI1': global(seenset2)";
  TEST_inc1aop  == "unpromoted/'including.opI1a': op([],[])";
  TEST_inc1bop  == "unpromoted/'including.r.opI1a': op([],[])";
  TEST_seenset1 == "deferred_sets/seenset1: set(global(seenset1))";
  TEST_seenset2 == "enumerated_sets/seenset2: set(global(seenset2))";
  TEST_seenelm1 == "enumerated_elements/seenelem1: global(seenset2)";
  TEST_seencst  == "concrete_constants/seencst: set(couple(global(seenset1),integer))";

  TEST_inc2var   == "abstract_variables/vI2a: seq(global(sA))";
  TEST_inc2op1   == "unpromoted/'including.add': op([global(sA)],[])";
  TEST_inc2op2   == "unpromoted/'including.get': op([],[global(sA)])";
  TEST_inc2op3   == "promoted/clear: op([],[])";
  TEST_internal1 == "concrete_constants/'included2.Param': set(global(sA))";
  TEST_internal2 == "concrete_constants/'included2.value': integer"
SETS sA
INCLUDES 
  included1,
  r.included1,
  included2(sA,6)
PROMOTES
  clear
VARIABLES
  vAa
INVARIANT
   vAa : sA
INITIALISATION
   vAa :: sA
OPERATIONS
  opAa = skip;
  addSomething = ANY e WHERE e:sA THEN add(e) END
END
