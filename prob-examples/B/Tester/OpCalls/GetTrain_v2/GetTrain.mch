MACHINE GetTrain
SETS trains = {t1,t2,t3}
DEFINITIONS
  SET_PREF_REQUIRE_OUTPUT_ASSIGNMENT == TRUE
CONSTANTS ts
PROPERTIES ts = [t1,t2,t3]
VARIABLES x
INVARIANT
 x: 0..(card(trains)-1)
INITIALISATION x:=0
OPERATIONS
  res <-- GetTrain = BEGIN res := ts(x+1) || x := (x+1) mod card(trains) END;
  res <-- GetTrainIdx(i) = PRE i:1..card(trains) THEN res := ts(i) END
;
  res <-- GetTrainIdxWhile(i) = PRE i:1..card(trains) THEN
      VAR jj IN
        jj := 1;
        res := ts(jj);
        WHILE jj<i DO
          jj := jj+1 ;
          res := ts(jj)
          INVARIANT jj:1..i
          VARIANT 10000+i-jj
        END//;
         // res := ts(jj)
      END
    END

END

