MACHINE SurjEnum
CONSTANTS c 
PROPERTIES c=0
VARIABLES xx
INVARIANT
 xx: 1..6 +->> 0..5
INITIALISATION xx::(1..6 +->> 0..5) 
OPERATIONS
  y <-- get = y:=xx[{3}]
   /* setxx1 = BEGIN xx::(2..3 +->> 0..1) END; */
   /* setxx2 = BEGIN xx::(1..6 +->> 0..5) END */
END