MACHINE GetTrain3
// Check that OpCalls can be used to assign output with same result variable name
INCLUDES GetTrain2
DEFINITIONS
  SET_PREF_REQUIRE_OUTPUT_ASSIGNMENT == TRUE
OPERATIONS
  res <-- GetNextTrain3 = BEGIN res := t1 ; res <-- GetNextTrain END;
  res <-- GetTrainWithIdx3(i) =  PRE i:1..card(trains) THEN
      res <-- GetTrainWithIdx(i) END;

res <-- GetTrainIdxWhile3(i) = PRE i:1..card(trains) THEN
      VAR jj IN
        jj := 1;
        res <-- GetTrainIdxWhile2(jj); // result not set error when commented out
        WHILE jj<i DO
          jj := jj+1 ;
          res <-- GetTrainIdxWhile2(jj)
          INVARIANT jj:1..i
          VARIANT 10000+i-jj
        END//;
          //res <-- GetTrainIdxWhile2(jj)
      END
    END
END

