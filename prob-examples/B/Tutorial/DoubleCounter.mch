MACHINE DoubleCounter
VARIABLES counter
INVARIANT
 counter:NATURAL & counter<=128
INITIALISATION counter:=8
OPERATIONS
  Double = PRE counter<100 THEN counter := 2*counter END;
  Halve = BEGIN counter := counter/2 END
END

