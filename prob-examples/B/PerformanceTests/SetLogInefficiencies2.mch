MACHINE SetLogInefficiencies2
/* an encdoing of some of the inefficiencies of {log}
   http://www.math.unipr.it/~gianfr/setlog.Home.html
   to test how ProB deals with them
*/
DEFINITIONS SET_PREF_CLPFD == TRUE //; "LibraryIO.def"
CONSTANTS intfun
PROPERTIES
 //observe(intfun) &
 /* now the same with integers */
 intfun : 1..100 --> POW(7..8) &
 !x.(x:1..100 => card(intfun(x)) = 1 ) &
  /* set up disequalities not strictily in order 1..100, so that without
     deterministic propagation we would enumerate intfun(2),..,intfun(20) wrongly */
 !x.(x:1..80 => intfun(x) /= intfun(x+20)) &
 !x.(x:1..19 => intfun(80+x) /= intfun(1+x)) & // forces intfun(2) /= intfun(1), ...
 8: intfun(1)

VARIABLES s
INVARIANT
 s <: NATURAL
INITIALISATION s:= {}
OPERATIONS
  r <-- INTFUN(x) = PRE x:1..100 THEN r:= intfun(x) END
END

