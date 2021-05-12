MACHINE UninitializedVAR

VARIABLES xx
INVARIANT
 xx:INTEGER
INITIALISATION xx:=0
OPERATIONS
  DoSomething1 = VAR yy IN
                     IF xx: yy THEN
                        yy := {xx,1}
                     END
                END;
  DoSomething2 = VAR zz IN
                     IF xx > 0 THEN
                        zz := 1
                     END;
                     xx := zz
                END;
  DoSomethingOK1 = VAR zz IN
                     IF xx > 0 THEN
                        zz := 1
                     ELSE
                        zz := 0
                     END;
                     xx := zz
                END;
  DoSomethingOK2 = VAR yy IN
                     yy := {xx,1};
                     IF xx: yy THEN
                        xx := card(yy)
                     END
                END
END

