


MACHINE SigmaProblem
  VARIABLES
   tmp

  INVARIANT
   tmp : 0..100


  ABSTRACT_CONSTANTS
   function
  PROPERTIES
   function : 0..10 --> NATURAL &
   function = % (p1). (p1 : 0..10 | ( SIGMA(idx1) . (idx1 : p1..10 |  
idx1 )))


  INITIALISATION
   tmp := 10

  OPERATIONS
   op1 =
   ANY v1 WHERE
   v1 : NATURAL &
   v1= function(5)
   THEN
   tmp := v1

   END

  END
