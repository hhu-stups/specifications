MACHINE GenericUsageOfSquare
USES SquaringFunction
DEFINITIONS
  Square_Def(aa) == (aa*aa)
VARIABLES
  /*@ unit "m" */ xx ,
  /*@ unit "m" */ yy,
  vv, ww
INVARIANT
 xx:NATURAL & yy:INTEGER &
 vv:NATURAL & ww:NATURAL
INITIALISATION xx:=2 || yy := -2 || vv := 0 || ww := 0
OPERATIONS
  Sq = BEGIN vv := Square_Def(xx) || ww <-- Square_Call(yy) END
END
