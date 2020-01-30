MACHINE GetTrain2
// Check that OpCalls can be used to assign output with same result variable name
INCLUDES GetTrain
OPERATIONS
  res <-- GetNextTrain = BEGIN res <-- GetTrain END;
  res <-- GetTrainWithIdx(i) =  BEGIN res <-- GetTrainIdx(i) END
END

