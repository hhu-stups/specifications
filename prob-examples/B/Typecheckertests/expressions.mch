/* This machine is not meant to be correct and/or animatable */
/* Just for type checking */
MACHINE expressions
DEFINITIONS

  TEST_givenA == "deferred_sets/seta:      set(global(seta))";
  TEST_givenB == "enumerated_sets/setb:    set(global(setb))";
  TEST_enum1 == "enumerated_elements/el1:  global(setb)";
  TEST_enum2 == "enumerated_elements/el2:  global(setb)";
  TEST_int   == "concrete_constants/vint:  integer";
  TEST_set   == "concrete_constants/vseta: global(seta)";
  TEST_pow   == "abstract_variables/vpowa: set(global(seta))";
  TEST_fun   == "abstract_variables/vfun:  set(couple(global(seta),global(setb)))";
  TEST_cart  == "abstract_variables/vcartesian: couple(couple(global(seta),global(setb)),integer)";
  TEST_any   == "assertions/ * / empty_set: set(any)";
  TEST_init  == "initialisation:            subst";
  TEST_op1   == "promoted/op1:              op([global(seta),couple(integer,integer)],[integer])"

SETS seta; setb={el1,el2}
CONSTANTS
  vint,
  vseta
PROPERTIES
    vint = 5
 &  vseta : seta
VARIABLES
  vpowa,
  vfun,
  vcartesian
INVARIANT
    vpowa : POW(seta)
 &  vfun : seta +-> setb
 &  vcartesian : seta * setb * NAT1
ASSERTIONS
  id({}) = {};
    {a,b,c| a:dom(vfun) & b:ran(vfun) & c=b|->a} 
  = (%x,y.(x:dom(vfun) & y:ran(vfun)| y|->x))
INITIALISATION
  vpowa,vfun := {},{} || vcartesian : (1=1)
OPERATIONS
  r <-- op1(arg1,arg2) =
    PRE arg1:vpowa & arg2:INT*INT THEN
      r := prj1(INT,INT)(arg2) * prj2(INT,INT)(arg2)
    END
END
