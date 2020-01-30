MACHINE SimpleProofDirectedTest1 /* This is very fast */
VARIABLES xx, complicated
INVARIANT
 xx:NATURAL & !y.(y<:complicated => SIGMA(x).(x:y|x) <1000)
INITIALISATION xx:=0 || complicated := 1..8
OPERATIONS
  Incxx = PRE xx<1000 THEN xx:=xx+1 END;
  Reset = PRE xx=1000 THEN xx:=0 || complicated := 1..7 END
END

