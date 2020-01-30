MACHINE SetLogInefficiencies3
/* an encdoing of some of the inefficiencies of {log}
   http://www.math.unipr.it/~gianfr/setlog.Home.html
   to test how ProB deals with them
*/
DEFINITIONS SET_PREF_CLPFD == TRUE
CONSTANTS int4fun
PROPERTIES

 /* now the same with a function to 4 integers */
 /* here we obtain multiple times the same solution */
 int4fun : 1..100 --> POW(7..11) &
 !x.(x:1..100 => card(int4fun(x)) = 4 &
                 /* 7:int4fun(x) & 8:int4fun(x) & 9:int4fun(x)) &  also works */
                 {7,8,9} <: int4fun(x)) &  /* does not work <<: */
 !x.(x:1..90 => int4fun(x) /= int4fun(x+10)) &
 !x.(x:1..9 => int4fun(90+x) /= int4fun(1+x)) &
 10: int4fun(1)
VARIABLES s
INVARIANT
 s <: NATURAL
INITIALISATION s:= {}
OPERATIONS
  r <-- INT4FUN(x) = PRE x:1..100 THEN r:= int4fun(x) END
END

