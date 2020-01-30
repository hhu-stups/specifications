MACHINE VerySimpleCounter
VARIABLES ct
INVARIANT
 ct:INTEGER & ct < 5
INITIALISATION ct:=0
OPERATIONS
  Inc = PRE ct < 4 THEN ct := ct+1 END;
  Reset = PRE ct = 4 THEN ct := 0 END
END

