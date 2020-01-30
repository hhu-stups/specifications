MACHINE LetTest

DEFINITIONS
  square(xx) == (xx*xx)

VARIABLES xx

INVARIANT xx: INTEGER

INITIALISATION
  xx := 2
  
OPERATIONS

  double = BEGIN
              LET yy BE yy = xx*2 IN
                xx := yy
              END
           END;
           
  square_double = BEGIN
              LET yy, zz BE yy = xx*2 & zz = yy*yy IN
                xx := zz
              END
           END;
           
  square_double1 = BEGIN
              LET yy,zz BE zz = yy*yy & yy = xx*2 IN
                xx := zz
              END
           END;
           
  square_double2 = BEGIN
              LET zz, yy BE 1+zz = yy*yy & yy = xx*2 IN  // not an id as LHS
                xx := zz
              END
           END;
           
  cycliclet = BEGIN
              LET zz, yy BE zz = yy & yy = zz IN // TO DO detect cyclic let
                xx := zz
              END
           END;
  notalldeflet = BEGIN
              LET zz, yy,vv BE zz = yy & yy = zz IN 
                xx := zz
              END
           END;
  defillegalvar = BEGIN
              LET zz BE zz = xx & xx = zz IN 
                xx := zz
              END
           END;
           
  Nondet = BEGIN
              LET yy BE yy:{1,2} IN // not an equality
                xx := yy
              END
           END
END