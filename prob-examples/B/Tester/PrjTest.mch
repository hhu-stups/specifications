MACHINE PrjTest
DEFINITIONS
 scope_S == 1..2;
 scope_T == 1..2
SETS S;T
VARIABLES
  p1
INVARIANT p1: (S*T) --> S
INITIALISATION
  p1 := prj1(S,T)
OPERATIONS 
 r<--test = r:=prj1(S,T);
 r2<--test2 = r2:= %(prj_par1,y).(prj_par1:S & y:T | prj_par1);  /* _prj_par1 wird korrekterweise nicht mehr akzeptiert */
 r3 <-- Project1(x,y) = PRE x:S & y:T THEN r3 := prj1(S,T)( x|-> y ) END;
 r3 <-- P1(x,y) = PRE x:S & y:T THEN r3 := p1( x|-> y ) END;
 r3 <-- Project2(x,y) = PRE x:S & y:T THEN r3 := prj2(S,T)( x|-> y ) END
END