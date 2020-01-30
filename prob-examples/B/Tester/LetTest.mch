MACHINE LetTest

DEFINITIONS
  square(xx) == (xx*xx)

VARIABLES xx

INVARIANT xx: INT

INITIALISATION
  xx := 2
  
OPERATIONS

  double = BEGIN
              LET yy BE yy = xx*2 IN
                xx := yy
              END
           END;
           
  square_double = BEGIN
              LET yy BE yy = xx*2 IN
                xx := square(yy)
              END
           END
END