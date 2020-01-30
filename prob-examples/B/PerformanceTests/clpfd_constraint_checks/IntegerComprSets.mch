MACHINE IntegerComprSets
/* Test whether comprehension sets below work even with smaller MAXINT values */
/* important to use b_arithmetic_expression to post X+X+X #= 60, rather than
   X+X #= X2, X2+X #= 60 */
DEFINITIONS
 SET_PREF_CLPFD == TRUE;
 SET_PREF_MAXINT == 10;
 SET_PREF_MININT == -1
CONSTANTS twenty, fifty
PROPERTIES
 {x|x+x+x=60} = twenty &
 twenty = {20} &
 fifty = {x|x>1000 & x<=1050} &
 card(fifty) = 50
OPERATIONS
  xx <-- Set(yy) = PRE yy:twenty THEN xx:= yy END
END

