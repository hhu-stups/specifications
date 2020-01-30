MACHINE ExistsDeadlockTests
 /* Test that CBC Deadlock Checker simplifies correctly and a counter example is
 found (xx={}) */
SETS
 ID={aa,bb}
VARIABLES xx
INVARIANT
 xx<:ID
INITIALISATION xx:={aa}
OPERATIONS
  OperationWithManyParameters(x,y,z,u,v,w,i,j,k,l) = PRE
     x : BOOL &
     y : STRING &
     z : NATURAL &
     u : [aa,bb] &
     v : NAT1 &
     w : 1..100 &
     i : ID &
     j : {bb} &
     k : xx &
     l > card(ID)*100  /* If we use card(xx) then b_interpreter_components keeps k and l together */
  THEN
   skip
  END
END

