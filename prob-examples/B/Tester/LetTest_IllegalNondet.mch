MACHINE LetTest_IllegalNondet

DEFINITIONS
  square(x2) == (x2*x2)

VARIABLES xx

INVARIANT xx: INTEGER

INITIALISATION
  xx := 2

OPERATIONS

  Nondet = BEGIN
              LET yy BE yy:{1,2} IN // not an equality
                xx := yy
              END
           END
END
