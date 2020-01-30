MACHINE LetTest_IllegalNotVarLHS

DEFINITIONS
  square(x2) == (x2*x2)

VARIABLES xx

INVARIANT xx: INTEGER

INITIALISATION
  xx := 2

OPERATIONS

  square_double2 = BEGIN
              LET zz, yy BE 1+zz = yy*yy & yy = xx*2 IN  // not an id as LHS
                xx := zz
              END
           END
END
