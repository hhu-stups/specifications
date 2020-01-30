MACHINE LetTest_IllegalCyclic

DEFINITIONS
  square(x2) == (x2*x2)

VARIABLES xx

INVARIANT xx: INTEGER

INITIALISATION
  xx := 2

OPERATIONS

  cyclic_let = BEGIN
              LET zz, yy BE zz = yy & yy = zz IN // TO DO detect cyclic let
                xx := zz
              END
           END
END
