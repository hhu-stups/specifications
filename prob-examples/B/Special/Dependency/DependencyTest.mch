MACHINE DependencyTest
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES iv:ID
VARIABLES xx
INVARIANT xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= iv END;

  Test = PRE #xx.(iv=aa & iv=aa) THEN skip END; /* Local Variable not used */

  Test2 = PRE #x2.(x2:ID & #x2.(x2:ID & x2=x2)) THEN skip END; /* local var  hides other local var */

  cc <-- Test3 = PRE cc:ID & cc=iv THEN cc := xx END;  /* op body uses cc */
  cc4 <-- Test4(x) = PRE x:ID THEN xx := x END;  /* no assignment to cc4 */
  Test5(pp) = PRE pp:ID THEN pp:= iv END /* assignment to parameter */
END

