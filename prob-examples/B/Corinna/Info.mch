MACHINE  Info(ITEM, sample, num)
DEFINITIONS scope_ITEM == 1..9
CONSTRAINTS sample : ITEM & num : NATURAL & num > card(ITEM) & num = card(ITEM)+1

CONSTANTS storage 

PROPERTIES storage : NATURAL1 & storage <= num

VARIABLES current, next, counter

INVARIANT current <: ITEM & next : ITEM & next/:current & counter:NATURAL1 & counter<=num
  
INITIALISATION current, next, counter := {}, sample, 2

OPERATIONS 
	input(nn)= 
		PRE nn:ITEM & nn /: current 
		THEN next, current := nn, current\/{next} /* nn=next?*/
		END;

	nn <-- output =
		PRE current /= {}
		THEN nn, current := next, current \/ {next} /*  INV */
		END;

	increment = 
		PRE counter<storage
		THEN counter := counter+1
		END
END