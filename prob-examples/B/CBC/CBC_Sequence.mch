MACHINE CBC_Sequence
/*CONSTANTS a,b,c
PROPERTIES
 a:INTEGER & b:INTEGER & c:NATURAL1 */
VARIABLES x, a,b,c
INVARIANT
 x:INTEGER &
 a:INTEGER & b:INTEGER & c:NATURAL1
INITIALISATION x::0..10 || a::INTEGER || b::INTEGER || c::(20..99)
OPERATIONS
  IsA = PRE x=a THEN skip END;
  IsB = PRE x=b THEN skip END;
  IsC = PRE x=c THEN skip END;
  Inc = BEGIN x:= x+1 END
END

/*
IsA;Inc;IsB;Inc;Inc;Inc;Inc;Inc;Inc;Inc;Inc;Inc;Inc;IsC
*/

