MACHINE SetLogInefficiencies
/* an encdoing of some of the inefficiencies of {log}
   http://www.math.unipr.it/~gianfr/setlog.Home.html
   to test how ProB deals with them
*/
CONSTANTS a,b, binfun, intfun, int4fun
PROPERTIES
 a = 10 & b = 3 &
 binfun : 1..100 --> POW(BOOL) &
 !x.(x:1..100 => card(binfun(x)) = 1 ) &

 !x.(x:1..80 => binfun(x) /= binfun(x+20)) &
 !x.(x:1..19 => binfun(80+x) /= binfun(1+x)) &
  /* check that {X} /= {Y} is dealt with efficienctly */
  /* set up disequalities not strictily in order 1..100, so that without
     deterministic propagation we would enumerate binfun(2),..,binfun(20) wrongly */
 TRUE : binfun(1) &

 /* now the same with integers */
 intfun : 1..100 --> POW(7..8) &
 !x.(x:1..100 => card(intfun(x)) = 1 ) &
  /* set up disequalities not strictily in order 1..100, so that without
     deterministic propagation using CLPFD we would enumerate binfun(2),..,binfun(10) wrongly */
 !x.(x:1..90 => intfun(x) /= intfun(x+10)) &
 !x.(x:1..9 => intfun(90+x) /= intfun(1+x)) &
 8: intfun(1)&

 /* now the same with a function to 4 integers */
 /* here we obtain multiple times the same solution */
 int4fun : 1..100 --> POW(7..11) &
 !x.(x:1..100 => card(int4fun(x)) = 4 &
                 /* 7:int4fun(x) & 8:int4fun(x) & 9:int4fun(x)) &  also works */
                 {7,8,9} <<: int4fun(x)) &
 !x.(x:1..99 => int4fun(x) /= int4fun(x+1)) &
 10: int4fun(1)
VARIABLES s
INVARIANT
 s <: NATURAL
INITIALISATION s:= {}
OPERATIONS
  r <-- BINFUN(x) = PRE x:1..100 THEN r:= binfun(x) END;
  r <-- INTFUN(x) = PRE x:1..100 THEN r:= intfun(x) END;
  r <-- INT4FUN(x) = PRE x:1..100 THEN r:= int4fun(x) END;
  TestNEQ2(x) = PRE x: INTEGER & {x} /= {a,b} & x:-1..100 THEN
     s := s \/ {x}
  END;
  r <-- TestInter = BEGIN r:= (1..20) - {10} END
END

