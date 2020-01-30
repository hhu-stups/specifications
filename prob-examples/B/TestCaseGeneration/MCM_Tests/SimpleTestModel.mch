MACHINE SimpleTestModel
CONSTANTS a,b
PROPERTIES
 a=1 & b:3..4
VARIABLES i,j
INVARIANT i:NATURAL & j:NATURAL
INITIALISATION
 i := 1 || j::1..3
OPERATIONS
  inc = BEGIN i,j := i+1,j+1 END;
  eq = SELECT i=b & j=b THEN skip END;
  gt(d) = SELECT i+j = a+b+d & d>0 THEN skip END;
  lt(d) = SELECT i+j = a+b-d & d>0 THEN skip END
END