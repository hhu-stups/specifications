MACHINE foo
VARIABLES x
INVARIANT
 x : INTEGER & x /= 2
INITIALISATION x := 1
OPERATIONS
  mk_two = PRE x > 0 THEN x := 2 END
END

