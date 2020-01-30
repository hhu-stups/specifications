MACHINE RangeComplementBig

VARIABLES  counter, set

INVARIANT  counter : 0..10000 & set : POW(INTEGER)

INITIALISATION counter := 0; set := 1..25000

OPERATIONS

	simulate = WHILE counter < 10000 DO
	      set := set - {};
	      counter := counter + 1
		  INVARIANT 1 = 1
		  VARIANT 10000 - counter
	      END

END