MACHINE RangeIntersectionBig

VARIABLES  counter, set1, set2

INVARIANT  counter : 0..10000 & set1 : POW(INTEGER) & set2 : POW(INTEGER)

INITIALISATION counter := 0; set1 := 1..25000; set2 := 1..3000

OPERATIONS
	simulate = WHILE counter < 10000 DO
	      set1 := set1 /\ set2;
	      counter := counter + 1
		  INVARIANT 1 = 1
		  VARIANT 10000 - counter
	      END

END