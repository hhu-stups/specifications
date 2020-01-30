MACHINE GetTrain
SETS trains = {t1,t2,t3}
CONSTANTS ts
PROPERTIES ts = [t1,t2,t3]
VARIABLES x
INVARIANT
 x: 0..(card(trains)-1)
INITIALISATION x:=0
OPERATIONS
  res <-- GetTrain = BEGIN res := ts(x+1) || x := (x+1) mod card(trains) END;
  res <-- GetTrainIdx(i) = PRE i:1..card(trains) THEN res := ts(i) END
END

