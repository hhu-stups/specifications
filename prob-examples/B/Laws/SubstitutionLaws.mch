MACHINE SubstitutionLaws
SETS
 ID={aa,bb}
VARIABLES xx, cnt
INVARIANT
 xx:ID & cnt:INT
DEFINITIONS
 /* KO == ASSERT TRUE=FALSE THEN skip END   does not work with BParser !? */
 ABORT == PRE TRUE=FALSE THEN skip END
INITIALISATION xx:=aa || cnt := 0
OPERATIONS
 TestSelect1 = SELECT 1=2 THEN ASSERT TRUE=FALSE THEN skip END
               WHEN 1=3 THEN ASSERT TRUE=FALSE THEN skip END
               WHEN 1=1 THEN skip /* should be taken */
               ELSE ASSERT TRUE=FALSE THEN skip END
              END;
 TestSelect2 = SELECT 1=2 THEN ASSERT TRUE=FALSE THEN skip END
               WHEN 1=3 THEN ASSERT TRUE=FALSE THEN skip END
               ELSE skip /* should be taken */
              END;
 TestSelect3 = SELECT 1=2 THEN ASSERT TRUE=FALSE THEN skip END
               WHEN 1=1 THEN skip /* this should be taken */
               WHEN 1=1 THEN skip /* or this */
               ELSE ASSERT TRUE=FALSE THEN skip END
              END;

 TestIf1 = IF 1=2 THEN ABORT ELSE skip END;
 TestIf2 = IF 1=1 THEN skip ELSE ABORT END;
 TestIf3 = IF 1=2 THEN ABORT END;
 TestIf4 = IF 1=2 THEN ABORT ELSIF 1=1 THEN skip ELSIF 1=1 THEN ABORT ELSE ABORT END;

 TestLet = LET cnt1 BE cnt1=1 IN 
              IF cnt1=0 THEN ABORT
                        ELSE cnt :: {0,1} END
          END;
 
 TestCase1 = CASE 1+1+1 OF EITHER 1 THEN ABORT OR 2 THEN ABORT OR 3 THEN skip END END;
 TestCase2 = CASE 1+1+1 OF EITHER 1 THEN ABORT OR 2 THEN ABORT OR 3 THEN skip ELSE ABORT END END;
 
 TestAny = ANY x WHERE x:{1,2,3} & x<3 THEN IF x=1 THEN skip ELSIF x=2 THEN skip ELSE ABORT END END;
 
  TestChoice = CHOICE xx := aa OR xx := bb END;
  
  TestAssert = ASSERT 1=1 THEN skip END;
  
  TestNestedPre(x) = PRE x:{1,2} THEN 
         PRE x<3 & x>0 THEN skip END
    END;
  TestSeqComposition = BEGIN xx := bb ; ASSERT xx=bb THEN xx:=aa ; ASSERT xx=aa THEN skip END END END;
  TestParallel = BEGIN BEGIN xx := aa || cnt := 2 END ; ASSERT xx=aa & cnt=2 THEN skip END END;

  TestWhile1 = BEGIN cnt:= 3; WHILE cnt>1 DO cnt := cnt-1 INVARIANT cnt:1..3 VARIANT cnt END; 
                    ASSERT cnt = 1 THEN skip END
              END;
  TestWhile2 = BEGIN cnt:= 2; WHILE cnt>4 DO cnt := cnt-1 INVARIANT cnt:1..3 VARIANT cnt END; 
                    ASSERT cnt = 2 THEN skip END
              END;
  TestVAR = VAR local IN local := xx; ASSERT local=xx THEN xx:=local END END;
  TestBecomeElementOf = BEGIN cnt :: {1,2} ; ASSERT cnt>0 & cnt<3 THEN skip END END;
  TestBecomeSuchThat1 = BEGIN cnt : (cnt : {1,2})  ; ASSERT cnt>0 & cnt<3 THEN skip END END;
  TestBecomeSuchThat2 = BEGIN cnt : (cnt : {1,2} & cnt /= cnt$0)  ; ASSERT cnt>0 & cnt<3 THEN skip END END;
  r <-- TestReturnValue = BEGIN r := cnt END
END

