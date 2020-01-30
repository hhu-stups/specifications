MACHINE SimpleCounter2
/* also use operation with return value */
DEFINITIONS MAX==10
VARIABLES count
INVARIANT
 count: 1..MAX
INITIALISATION count := 1
OPERATIONS
  Increase(y) = PRE y: 1..(MAX-count) THEN
     count := count+y
  END;
  Halfway = PRE count = MAX/2 THEN skip END;
  r <-- Reset = PRE count=MAX THEN count := 1 || r := count END
END