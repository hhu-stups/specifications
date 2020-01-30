MACHINE
  loop_invariant_abstract
VARIABLES
  x
INVARIANT
  x : NAT
INITIALISATION
  x := 0
OPERATIONS
  set(new) =
    PRE new:NAT & x<=new THEN
      x := new
    END
END