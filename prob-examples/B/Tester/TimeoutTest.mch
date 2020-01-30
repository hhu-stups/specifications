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
  TimeoutDLK(yy) = PRE yy:ID & !x.(x<:POW(ID) => {yy}:x) THEN xx:= yy END
END

