MACHINE SimpleCounterForMC
DEFINITIONS MAX==6; SET_PREF_MAX_OPERATIONS==10
VARIABLES count
INVARIANT
 count: 1..MAX
INITIALISATION count := 1
OPERATIONS
  Increase(y) = PRE y: 1..(MAX-count) THEN
     count := count+y
  END;
  Reset = BEGIN count :: 1..MAX END
  /* ResetErr = BEGIN count :: 1..MAX+1 END */
END

