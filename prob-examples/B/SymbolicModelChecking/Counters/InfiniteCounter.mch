MACHINE VerySimpleCounter
VARIABLES ct
INVARIANT
 ct:INTEGER
INITIALISATION ct:=0
OPERATIONS
  Inc = ct := ct+1;
  Reset = ct := 0
END

