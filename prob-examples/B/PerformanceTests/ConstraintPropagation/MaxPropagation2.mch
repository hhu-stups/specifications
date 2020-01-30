MACHINE MaxPropagation2
/* check if min and max propagate constraints if min/max known but set is not */
DEFINITIONS
 SET_PREF_MAXINT == 10000;
 SET_PREF_CLPFD == TRUE
CONSTANTS numbers, interval, mx
PROPERTIES
 numbers : POW1(NATURAL) & mx=max(numbers) &
 card(numbers) = 5 &  
 min(numbers) = 990 & max(numbers)<= 994 &
 interval : POW1(NATURAL) &
 max(interval) = max(numbers) &
 min(interval) = min(numbers) &
 card(interval) = 2
OPERATIONS
  nn <-- Numbers = BEGIN nn := numbers END;
  Set(yy) = PRE yy:numbers THEN skip END;
  Seti(yy) = PRE yy:interval THEN skip END
END
