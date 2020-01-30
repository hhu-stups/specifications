/* The trick of this testcase is that the properties are computed
   by Kodkod but the invariant by ProB itself, detecting wrong
   solutions of the constants */
MACHINE kodkod_overflow
CONSTANTS x,y
PROPERTIES
  x:1..100 &
  y:2..88  &
  /* the predicate analysis might come to the conclusion that
     x*y : 3..188 
     which can lead to an (unnoticed) integer overflow in Kodkod */
  x+y=x*y
VARIABLES
  dummy 
INVARIANT
  dummy : INTEGER & 
  x+y=x*y
INITIALISATION
  dummy := 0
END