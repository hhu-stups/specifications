MACHINE PrjTypeCheckTest
DEFINITIONS
 scope_S == 1..2;
 scope_T == 1..2
SETS S;T
VARIABLES
  p1,x
INVARIANT p1: (S*T) --> S & 
  p1 /= prj1(T,T)  /* type error */ & 
  p1 = prj1(S,T)  /* not a type error */
  & x:NATURAL
INITIALISATION
  p1 := prj1(S,T)
     || x:= S /* type error */
OPERATIONS
  set_x_such1 = x : (x:NAT0 & x=1);
  set_x_such2 = x : (x:S);
  set_p1a = p1 := prj1(T,T);  /* type error detected */
  set_p1b = p1 := prj1(S,S);  /* type error now detected */
  illegal_assign = BEGIN x := 1 END;
  y <-- error_assign = BEGIN x := 1+S /* type error detected */
           || y:= 1 END;
  set_x = BEGIN x:: S END /* type error */
END