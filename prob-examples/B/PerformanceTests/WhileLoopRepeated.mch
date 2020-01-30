MACHINE WhileLoopRepeated
CONSTANTS lim
PROPERTIES
 lim = 2**20
VARIABLES count
INVARIANT count : NATURAL
INITIALISATION count := 1
OPERATIONS
  Finished = PRE count > lim THEN skip END;
  Increase(c) = PRE c=count THEN
         VAR ii IN
           ii := count;
           WHILE ii > 0 DO
             ii := ii-1;
             count := count+2
          INVARIANT ii:NATURAL
          VARIANT ii
          END
         END
      END;
 Decrease = PRE count>1 THEN count := count-1 END
END

