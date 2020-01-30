MACHINE VerySimpleCounter
VARIABLES ct, ict
INVARIANT
 ct:INTEGER & ct < 4 &
 ict:INTEGER
INITIALISATION ct,ict:=0,0
OPERATIONS
  IncCT = PRE ct < 4 THEN ct := ct+1 END;
  IncICT = ict := ict+1;
  Reset = PRE ct = 4 THEN ct := 0 END
END

