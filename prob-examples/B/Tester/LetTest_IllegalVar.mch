MACHINE LetTest_IllegalVar

DEFINITIONS
  square(x2) == (x2*x2)

VARIABLES xx

INVARIANT xx: INTEGER

INITIALISATION
  xx := 2

OPERATIONS

  defillegalvar = BEGIN
              LET zz BE zz = xx &
                        xx = zz   /* illegal */
                     IN
                xx := zz
              END
           END
END
