MACHINE definitions
DEFINITIONS
  PRED == x<y;
  divides(a,b) == #z.(z:NAT1 & a*z = b);

  SUM  == x+y;
  medium(a,b) == (a+b)/2;

  SKIP == skip;
  tonull(a) == a := 0;

  TEST_pred       == "invariant/ * /less: pred";
  TEST_predargs   == "operation_bodies/op1/precondition/exists: pred";
  TEST_expr       == "operation_bodies/op2/ * /add: integer";
  TEST_exprargs   == "operation_bodies/op3/ * /div: integer";
  TEST_subst      == "operation_bodies/op4/skip: subst";
  TEST_substargs  == "operation_bodies/op5/assign_single_id: subst";
  TEST_substargs2 == "operation_bodies/op5/assign_single_id/x: integer"
  /* was previously:
  TEST_substargs  == "operation_bodies/op5/assign: subst";
  TEST_substargs2 == "operation_bodies/op5/assign/x: integer"
  */
VARIABLES
  x,y
INVARIANT
  x:INTEGER & y:INTEGER & PRED
INITIALISATION
  x,y := 5,20
OPERATIONS
  op1 = PRE divides(x,y) THEN skip END;
  result <-- op2 = BEGIN result := SUM END;
  result <-- op3 = BEGIN result := medium(x,y) END;
  op4 = SKIP;
  op5 = tonull(x)
END
