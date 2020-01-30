MACHINE SetIntersectionBig2

VARIABLES  counter, set1, set2, set3

INVARIANT  counter : 0..10000 & set1 : POW(INTEGER) & set2 : POW(INTEGER) & set3 : POW(INTEGER)

INITIALISATION counter := 0;
 set1 := (1..35000) - {24999}; set2 := 1..2000 \/ {-1}; // ensure that we have two non-intervals
 set3  := 1..45000
  // as of 17/10/2018 ProB is faster as it dynamically chooses based on AVL height how to do intersection
OPERATIONS
	simulate = WHILE counter < 5000 DO
	      set3 := set1 /\ set2;
	      set3 := set3 /\ set1;
	      counter := counter + 1
		  INVARIANT 1 = 1
		  VARIANT 10000 - counter
	      END

END
