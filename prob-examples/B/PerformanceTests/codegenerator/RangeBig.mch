MACHINE RangeBig

VARIABLES  counter, set

INVARIANT  counter : 0..10000 & set : POW(INTEGER)

INITIALISATION counter := 0; set := {}

OPERATIONS

	simulate = WHILE counter < 1000 DO
	      set := 1..25000;
	      counter := counter + 1
		  INVARIANT 1 = 1
		  VARIANT 10000 - counter
	      END

END