MACHINE RecNatFunLoop
DEFINITIONS
Init == x = k;
ABSTRACT_CONSTANTS k, f
PROPERTIES
(f = %(p).(p : NATURAL | (%(t_).(t_ = 0 & p = 0 | 0) \/ %(t_).(t_ = 0 & not(p = 0) | p + f((p - 1))))(0)) & k : INTEGER) & f(0) = 0
VARIABLES x
INVARIANT
x : INTEGER
ASSERTIONS
 !x.(x:INTEGER => -1 |-> x /: f)
INITIALISATION
x:(Init)
OPERATIONS
Inc = BEGIN x := x + 1 END;

Reset = BEGIN x := 1 END;

Dec = BEGIN x := x - 1 END;

Set(p) = SELECT p : {f(x)} THEN  /* function applied outside of domain detected in aggressive abort checking mode */
  x := p END
END
