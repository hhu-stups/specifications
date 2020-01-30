MACHINE ErrorInLibraryCall
/* A small example to show how we can use the ProB external Math Library */
DEFINITIONS

 EXTERNAL_FUNCTION_SINx == INTEGER*INTEGER --> INTEGER;
 SINx(m,x) == sinx(m,x); 
CONSTANTS sinx
PROPERTIES 
  sinx: NATURAL1*INTEGER --> INTEGER &
  sinx = %(m,x).(x:INTEGER & m:NATURAL1|SINx(m,x)) /* EXTERNAL */
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
  Inc = xx:=xx+1;
  Inc10 = xx:=xx+10;
  r <-- GetSinErr = r := SINx(10-xx,xx) /* error when xx=10 */
END

