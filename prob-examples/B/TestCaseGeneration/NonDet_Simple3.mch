MACHINE NonDet_Simple3 // a more complex version of Simple1
VARIABLES 
  pos1, pos2, speed
INVARIANT
  pos1:NATURAL & pos2:NATURAL & speed:INTEGER
INITIALISATION
  pos1 := 9 || pos2 := 0 || speed := 0
OPERATIONS
  Env_Update = BEGIN pos1 :: (pos1+1)..(pos1+10) END;
  Train_update = BEGIN pos2 := pos2+2*speed END;
  Train_change_speed(delta) = 
   SELECT delta > -3 & delta < 3 & delta >= -speed THEN
      speed := speed+delta
  END;
  Collision = SELECT pos1=pos2 THEN skip END;


  Train_change_speedIF(delta) = PRE delta : -4..4 THEN
   IF delta > -3 & delta < 3 & delta >= -speed THEN
      speed := speed+delta // may write, but deterministic
  END END;
  Train_change_speedIFSeq(delta) = PRE delta : -4..4 THEN
   speed := speed +1;
   IF delta > -3 & delta < 3 & delta >= -speed THEN
      speed := speed+delta // may write, but deterministic
  END END;
  Train_change_speedVar =
  VAR delta IN
   delta :: -1..1;
   speed := speed+delta  // not yet detected as non-det
   END;
  Train_change_ANY =
    ANY delta WHERE delta:-1..1 THEN
      speed := speed + delta // detected
   END;
  Train_change_speedVarIF =
  VAR delta IN
   delta :: -4..4;
   IF delta > -3 & delta < 3 & delta >= -speed THEN
      speed := speed+delta
  END END
END