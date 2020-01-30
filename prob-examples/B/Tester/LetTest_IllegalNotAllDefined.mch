MACHINE LetTest_IllegalNotAllDefined

DEFINITIONS
  square(x2) == (x2*x2)

VARIABLES xx

INVARIANT xx: INTEGER

INITIALISATION
  xx := 2

OPERATIONS

  notalldeflet = BEGIN
              LET zz, yy,vv BE
                  zz = xx & yy = zz IN  /* does not define vv */
                xx := zz
              END
           END
END
