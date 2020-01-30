MACHINE RangeCardBig

VARIABLES  counter, set, result

INVARIANT  counter : 0..10000 & set : POW(INTEGER) & result : INTEGER

INITIALISATION counter := 0; set := 1..25000; result := 0

OPERATIONS

	simulate = WHILE counter < 10000 DO
	      result := card(set);
	      counter := counter + 1
		  INVARIANT 1 = 1
		  VARIANT 10000 - counter
	      END

END