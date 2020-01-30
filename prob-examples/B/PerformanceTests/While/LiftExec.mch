MACHINE LiftExec

CONSTANTS LIM

PROPERTIES LIM : NATURAL

INCLUDES Lift

VARIABLES  counter

INVARIANT  counter : 0..LIM

INITIALISATION counter := 0

OPERATIONS

	simulate = WHILE counter < LIM DO
		    VAR i IN
		       i := 0;
		       WHILE i < 100 DO
             inc;
             i := i+1
            INVARIANT 1 = 1
            VARIANT 100 - i
		       END // WHILE i
		    END;
	      VAR i IN
		       i := 0;
		       WHILE i < 100 DO
               dec;
               i := i+1
              INVARIANT 1 = 1
              VARIANT 100 - i
		       END // WHILE i
		    END;
	      counter := counter + 1
		    INVARIANT 1 = 1
		    VARIANT LIM - counter
	  END // WHILE counter

END
