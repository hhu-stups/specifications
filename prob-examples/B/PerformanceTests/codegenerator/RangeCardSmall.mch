MACHINE RangeCardSmall

VARIABLES  counter, set, result

INVARIANT  counter : 0..5000000 & set : POW(INTEGER) & result : INTEGER

INITIALISATION counter := 0; set := 0..5; result := 0

OPERATIONS

	simulate = WHILE counter < 5000000 DO
	      result := card(set);
	      counter := counter + 1
		  INVARIANT 1 = 1
		  VARIANT 5000000 - counter
	      END

END