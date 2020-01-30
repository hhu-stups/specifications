MACHINE SimpleCounter
DEFINITIONS MAX==100
VARIABLES count
INVARIANT
 count: 1..MAX
INITIALISATION count := 1
OPERATIONS
  Increase(y) = PRE y: 1..(MAX-count) THEN
     count := count+y
  END;
  Halfway = PRE count = MAX/2 THEN skip END;
  Reset = PRE count=MAX THEN count := 1 END
END