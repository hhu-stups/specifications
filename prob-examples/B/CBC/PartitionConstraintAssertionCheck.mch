MACHINE PartitionConstraintAssertionCheck
/* check if we can find a counter example to the assertion or deadlock */
CONSTANTS x,y,z,v
PROPERTIES
 ( x \/ y \/ z \/ v = 1101..1110 &
 /* y /\ z = {} & */
 x /\ y = {} & x /\ z = {} &
 x /\ v = {} & y /\ v = {} & z /\ v = {} &
 card(x)=card(y)+2 & card(z) = card(v)+2)
ASSERTIONS
 not(y /\ z = {})
OPERATIONS
  Y_neq_Z = PRE not(y /\ z = {}) THEN skip END
END

