MACHINE Test_BZTT3
SETS
  ID = {a,b,c,d,e,f,g}
VARIABLES
  fun,x,s
INVARIANT
  fun: (ID --> ID) &
  x: ID &
  s: POW(ID)
INITIALISATION
  fun := {a|->b,b|->c, c|->d, d|->e, e|->f, f|->g, g|->a} ||  
   /* BZTT does not support SubstBecomeSuch */
  x := a ||
  s := ID
OPERATIONS
  ApplyF = BEGIN x:= fun(x) END;
  Fixp(z) = PRE z:ID & z = fun(z) THEN x:=z END;
  Find(T) = PRE T:ID & fun(T) = x THEN x:=T END;
  Iterate = BEGIN fun := (fun ; fun) END;

  Solve1(ff) = PRE ff: ID --> ID & ff(a)/=ff(b) & ff(b)/=ff(c) & ff(c)/=ff(d) &
     ff(d)/=ff(e) & ff(e) /= ff(g) & ff(g) = a & ran(ff) = {a,b} THEN fun := ff END;

 /* BZTT allows to execute the following event (even though it should not): */   
  UnSolveable1(ff) = PRE ff: ID --> ID & ff(a)/=ff(b) & ff(b)/=ff(c) & ff(c)/=ff(d) &
     ff(d)/=ff(e) & ff(e) /= ff(g) & ff(g) = a & ff(a)=a & ran(ff) = {a,b} THEN fun := ff END;


  Solve2(ff) = PRE ff: ID --> ID & (ff;ff)=ff & ran(ff) = {a} THEN fun := ff END

/* does not work with BZTT, parse error:
  Solve3(ff) = PRE ff: ID --> ID & (ff=ff~) & (ff;ff)=ff THEN fun := ff END
*/
END
