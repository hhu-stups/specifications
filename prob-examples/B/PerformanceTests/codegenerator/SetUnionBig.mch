MACHINE SetUnionBig

VARIABLES  counter, set

INVARIANT  counter : 0..35000 & set : POW(INTEGER)

INITIALISATION counter := 25001; set := (1..25000) - {24999}

OPERATIONS

	simulate = WHILE counter < 35000 DO
	      set := set \/ {counter};
	      counter := counter + 1
		  INVARIANT 1 = 1
		  VARIANT 35000 - counter
	      END

END