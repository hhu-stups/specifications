MACHINE SequenceWDTest
SETS
 ID={aa,bb}
CONSTANTS n
PROPERTIES
 n=5
VARIABLES arr, i
INVARIANT
  arr: 1..n --> BOOL &
  i: 1..n
INITIALISATION arr := (1..n)*{FALSE} || i := n
OPERATIONS
  Set(j) = PRE j:1..(n-1) THEN
      i := j;
      i := i+1;
      arr(j) := arr(i)
  END
END

