MACHINE PrependLargeSequence
CONSTANTS n
PROPERTIES
 n = 22000
VARIABLES f, g, i
INVARIANT
 f:INTEGER <-> INTEGER & i: 1..(n+1) & g: INTEGER <-> INTEGER
INITIALISATION f := %x.(x:1..n | x+1) || g := %x.(x:1..n | x+2) || i:= (n-100)
OPERATIONS
  SetFi = SELECT i<=n THEN
    i:=i+1 ||
    f := i -> f ||
    g := i -> g
  END
END

