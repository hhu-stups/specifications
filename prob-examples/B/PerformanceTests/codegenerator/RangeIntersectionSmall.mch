MACHINE RangeIntersectionSmall

VARIABLES  counter, set

INVARIANT  counter : 0..5000000 & set : POW(INTEGER)

INITIALISATION counter := 0; set := 0..5

OPERATIONS

	simulate = WHILE counter < 5000000 DO
	      set := set /\ 0..5;
	      counter := counter + 1
		  INVARIANT 1 = 1
		  VARIANT 5000000 - counter
	      END

END