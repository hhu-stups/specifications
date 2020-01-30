MACHINE GetTrain2
// Check that OpCalls can be used to assign output with same result variable name
INCLUDES GetTrain
OPERATIONS
  res <-- GetNextTrain = BEGIN res := t1 ; res <-- GetTrain END;
  res <-- GetTrainWithIdx(i) =  PRE i:1..card(trains) THEN
      res <-- GetTrain ;
      res <-- GetTrainIdx(i)
     END
     ; 
res <-- GetTrainIdxWhile2(i) = PRE i:1..card(trains) THEN
      VAR jj IN
        jj := 1;
        res <-- GetTrainIdxWhile(1)
;
        WHILE jj<i DO
          jj := jj+1;
          res <-- GetTrainIdxWhile(jj)
          INVARIANT jj:1..i
          VARIANT 1+i-jj
        END//;
         // res <-- GetTrainIdxWhile(jj)
         
      END
    END

END

