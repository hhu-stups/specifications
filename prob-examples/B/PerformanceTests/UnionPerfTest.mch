MACHINE UnionPerfTest /* version with <<| and  \/ */
CONSTANTS n
PROPERTIES
 n = 1200
VARIABLES f, g, i
INVARIANT
 f:INTEGER <-> INTEGER & i: 1..(n+1) & g: INTEGER +-> INTEGER
INITIALISATION f := %x.(x:1..n | x+1) || g := %x.(x:1..n | x+2) || i:= 1
OPERATIONS
  SetFi = SELECT i<=n THEN
    i:=i+1 ||
    f := f \/ g \/ {(1,1)} ||
    g := ( {i} <<| g) \/ {i |-> i+3} 
  END
END

