MACHINE SubstitutionSeqCompAssertErrCheck
SETS
 ID={aa,bb}
VARIABLES xx, cnt
INVARIANT
 xx:ID & cnt:INT
INITIALISATION xx:=aa || cnt := 0
OPERATIONS
  TestSeqComposition = BEGIN 
     xx := bb ; 
     ASSERT xx=bb THEN xx:=aa ; 
                       ASSERT xx=bb THEN skip END /* This assert should fail */
     END
  END
END