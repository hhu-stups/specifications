MACHINE multorcart
SETS
 S;T
VARIABLES a,b,c
INVARIANT
  a = b*c
  & b <: S
  & c <: T
INITIALISATION a,b,c := {},{},{}
END

