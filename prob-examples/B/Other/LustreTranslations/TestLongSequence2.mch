MACHINE TestLongSequence
VARIABLES xx, choices
INVARIANT
 xx:NATURAL & choices : seq(BOOL)
INITIALISATION xx:=1 || choices := {}
OPERATIONS
  Compute(yy) = PRE yy:1..6 & yy mod 2  =1 THEN
       choices := {};
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END;
       IF xx mod 2  = 0 THEN
          choices := choices <- TRUE ||
          xx := xx+yy
       ELSE
          choices := choices <- FALSE ||
          xx := xx+yy+2
       END
    END
END

