MACHINE NonDet_Simple1
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
  Collision = SELECT pos1=pos2 THEN skip END
END