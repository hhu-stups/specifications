MACHINE BigNumbers

VARIABLES  counter, value

INVARIANT  counter : INTEGER & value : INTEGER

INITIALISATION counter := 0; value := 10000000000000000000

OPERATIONS
	simulate = WHILE counter < 5000000 DO
	        counter := counter + 1;
	        value := value + 1
		  INVARIANT 1 = 1
		  VARIANT 5000000 - counter
	      END

END