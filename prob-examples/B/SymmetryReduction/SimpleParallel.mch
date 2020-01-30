MACHINE SimpleParallel
CONSTANTS MAX
PROPERTIES MAX = 10
VARIABLES
  array
INVARIANT
  array: 1..MAX +-> BOOL
INITIALISATION
  array := %x.(x:1..MAX|FALSE)
OPERATIONS
  setbit(i) = PRE i:1..MAX & array(i)=FALSE THEN
    array(i) := TRUE
  END;
  reset = PRE ran(array) = {TRUE} THEN
    array := %x.(x:1..MAX|FALSE)
  END
END