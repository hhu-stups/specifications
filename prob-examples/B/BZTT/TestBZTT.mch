MACHINE Test_BZTT
SETS
  ID = {a,b,c,d,e,f,g}
VARIABLES
  fun,x,s
INVARIANT
  fun: (ID --> ID) &
  x: ID &
  s: POW(ID)
INITIALISATION
  fun :: ID --> ID ||  
   /* BZTT does not support SubstBecomeSuch */
  x := a ||
  s := ID
OPERATIONS
  ApplyF = BEGIN x:= fun(x) END;
  Fixp(z) = PRE z:ID & z = fun(z) THEN x:=z END;
  /* The following operation causes BZTT to loop/crash: */
  SetF(ff) = PRE ff: ID-->ID & !y.(y:ID => ff(y) /= y) THEN
     fun := ff
  END;
  /* The following works with BZTT, but BZTT is unsound and allows to execute and valuate
     Fixp after SetF2 ! */
 /* ProB can validate the following: G( [SetF2] => X not e(Fixp)) */
  SetF2(ff) = PRE ff: ID-->ID &
               ff(a)/=a & ff(b)/=b & ff(c)/=c & ff(d)/=d & ff(e)/=e & ff(f)/=f & ff(g)/=g THEN
     fun := ff
  END
END
