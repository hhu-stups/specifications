/*
This test case is an example for the importance of using the right set of predicates 
when determining the impossible relations in a model for the partial guard evaluation optimisation.

Consider the events e1, e2, and e3 below. The machine has obviously a deadlock state after 
executing the trace [e1;e2].

If we test whether e2 is possible after the execution of e1 by means of the test_path predicate, then we get the following result:

test_path(x<3, [e1], x=2) ---> call is true

In the call above we just took the guard of e1 as precondition before executing e1. Now if we want to check for deadlock freedom and we consider in the precondition also the invariant of the model, then we will get as a result from the enabling analysis that e2 is impossible to be enabled after the execution of e1 because the following call will fail

test_path(x<3 & x<1, [e1], x=2)

This means that in the state [x=2] (the successor state after executing e1 from the initial state) the event e2 will be considered as disabled at [x=2] and will not be executed at [x=2] and thus the state [x=4], which is a deadlock state, will not be discovered by the model checker when applying partial guard evaluation 
*/

MACHINE PGE_Deadlock
VARIABLES x
INVARIANT
 x:NAT & x /= 1
INITIALISATION x:=1
OPERATIONS
  e1 = PRE x<2 THEN x:=x+1 END;
  e2 = PRE x=2 THEN x:=3 END;
  e3 = PRE x/=3 THEN skip END
END

