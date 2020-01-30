MACHINE MaxPropagation
/* check if min and max propagate constraints if min/max known but set is not */
DEFINITIONS
 SET_PREF_MAXINT == 1000;
 SET_PREF_CLPFD == TRUE
CONSTANTS numbers
PROPERTIES
 numbers : POW1(NATURAL) &
 card(numbers) = 3 &  
 min(numbers) = 990 & max(numbers)<= 992
OPERATIONS
  nn <-- Numbers = BEGIN nn := numbers END;
  Set(yy) = PRE yy:numbers THEN skip END
END

