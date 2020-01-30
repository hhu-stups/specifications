MACHINE NegDivision
/* ASSERTIONS
 -1 / 4 = 0 */
VARIABLES xx
INVARIANT
 xx:-100..100 &
 (-xx) / 4 = - (xx/4) &
 (-xx) / (-4) = (xx/4) &
 (xx) / (-4) = -(xx/4)
INITIALISATION xx:=0
OPERATIONS
  Dec = PRE xx>-100 THEN xx:= xx-1 END;
  Inc = PRE xx<100 THEN xx:= xx+1 END
END

