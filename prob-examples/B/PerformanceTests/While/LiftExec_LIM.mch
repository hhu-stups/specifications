MACHINE LiftExec_LIM
 // Nested WHILE loops with two while loops seems to cause quadratic runtime
CONSTANTS LIM, LIMi
PROPERTIES
 LIM : NATURAL & LIMi = 100

INCLUDES Lift

VARIABLES  counter

INVARIANT  counter : 0..LIM

INITIALISATION counter := 0

OPERATIONS

	simulate =
		  VAR i IN
		    WHILE counter < LIM DO
		       i := 0;

		       WHILE i < LIMi DO
             //inc;
             i := i+1
            INVARIANT 1 = 1
            VARIANT LIMi - i
		       END // WHILE i
		       ;

		       i := 0;

		       WHILE i < LIMi DO
              // dec;
               i := i+1
              INVARIANT 1 = 1
              VARIANT LIMi - i
		       END; // WHILE i

	         counter := counter + 1

		      INVARIANT 1 = 1
		      VARIANT LIM - counter
	      END // WHILE counter
     END // VAR
END
