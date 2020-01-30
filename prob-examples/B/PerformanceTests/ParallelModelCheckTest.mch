MACHINE ParallelModelCheckTest
CONSTANTS n
PROPERTIES
 n=5
VARIABLES f,i
INVARIANT
 f: 0..n --> 0..n &
 i:0..n &
 SIGMA(j).(j:dom(f)|f(j)) > 0 &
 PI(j).(j:dom(f)|f(j)) >= 0 
INITIALISATION 
  f := %x.(x:0..n|x) ||  i:= 0
OPERATIONS
  Reset = PRE i=n THEN i:= 0 END;
  Inc = PRE i<n THEN f(i) := (f(i) + 1) mod n || i := i+1 END;
  Inc3 = PRE i<n THEN f(i) := (f(i) + 2) mod n || i := i+1 END
END

