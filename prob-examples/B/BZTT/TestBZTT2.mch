MACHINE Test_BZTT2
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
  NonInj(z1,z2) = PRE z1:ID & z2:ID & fun(z1) = fun(z2) & z1/=z2 THEN x:=z1 END;
  /* The following works with BZTT, but BZTT is unsound and allows to execute and valuate
     Fixp and NonInj after SetF2 ! */
 /* ProB can validate the following: G( [SetF3] => X not e(Fixp)) */
  SetF3(ff) = PRE ff: ID-->ID &
               ff(a)/=a & ff(b)/=b & ff(c)/=c & ff(d)/=d & ff(e)/=e & ff(f)/=f & ff(g)/=g &
               ff(a)/=ff(b) & ff(a) /= ff(c) & ff(a) /= ff(d) & ff(a) /= ff(e) & ff(a) /= ff(f) & ff(a) /= ff(g) &
               ff(b) /= ff(c) & ff(b) /= ff(d) & ff(b) /= ff(e) & ff(b) /= ff(f) & ff(b) /= ff(g) &
               ff(c) /= ff(d) & ff(c) /= ff(e) & ff(c) /= ff(f) & ff(c) /= ff(g) &
               ff(d) /= ff(e) & ff(d) /= ff(f) & ff(d) /= ff(g) &
               ff(e) /= ff(f) & ff(e) /= ff(g) &
               ff(f) /= ff(g) THEN
     fun := ff
  END
END
