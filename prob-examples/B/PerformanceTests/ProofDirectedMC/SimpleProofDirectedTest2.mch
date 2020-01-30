MACHINE SimpleProofDirectedTest1 /* This is quite slow; ProB does not yet detect
 that the complicated invariant does not have to be evaluated */
VARIABLES xx, complicated
INVARIANT
 xx:NATURAL & !y.(y<:complicated => SIGMA(x).(x:y|x) <1000)
INITIALISATION xx:=0 || complicated := 1..8
OPERATIONS
  Incxx_Reset = IF xx<1000 THEN xx:=xx+1 
                ELSE xx:=0 || complicated := 1..7 END
END

