MACHINE InfinitePartialSqrtFunction
/* Check that ProB can deal with a partial infinite function, and also check
 whether values are in its domain */
CONSTANTS mysqrt
PROPERTIES
 mysqrt = {x,y|y:NATURAL & y*y=x} /* a partial square root function; detected as infinite by ProB */
 /* Note:  {x,y|y:NATURAL & x:NATURAL & y*y=x}  is no longer detected as infinite;
  indeed  {x,y|y:NATURAL & x:NATURAL & -(y*y)=x}  would be empty and finite */
/* these do not work yet without expansion :
ASSERTIONS
 ([1,4,9,16] ; mysqrt) = [1,2,3,4];
 mysqrt[{1,4,9}] = {1,2,3} */
VARIABLES xx
INVARIANT
 xx:NATURAL1
INITIALISATION xx:=1
OPERATIONS
  Inc = xx := xx+1;
  Inc5 = xx := xx+5;
  r <-- SquareRoot = IF xx:dom(mysqrt) THEN r:= mysqrt(xx) ELSE r:= -1 END
END

