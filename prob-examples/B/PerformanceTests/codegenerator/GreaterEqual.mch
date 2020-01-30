MACHINE GreaterEqual

VARIABLES  counter

INVARIANT  counter : INT

INITIALISATION counter := 0

OPERATIONS
	simulate = WHILE counter < 5000000 & 2>=1 DO
	        counter := counter + 1
		  INVARIANT 1 = 1
		  VARIANT 5000000 - counter
	      END

END