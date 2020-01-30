MACHINE TimeoutTest
DEFINITIONS SET_PREF_TIME_OUT == 1000
SETS
 ID={aa,bb,cc,dd,ee,ff,gg,hh}
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  TimeoutDLK(yy) = PRE yy:ID & !x.(x<:POW(ID) => {yy}:x) THEN xx:= yy END;
  Timeout(yy) = PRE yy:{aa,bb} & (yy=bb => !x.(x<:POW(ID) => {yy}:x)) THEN xx:= yy END;
  VTimeoutOK(yy) = PRE yy:NATURAL & yy mod 100 = 1 THEN skip END;
  VTimeoutWD(yy) = PRE yy:INTEGER & yy mod 100 = 1 THEN skip END
END

