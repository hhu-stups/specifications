MACHINE TransitiveClosure
SETS
 ID = {id1,id2}
CONSTANTS tclos
PROPERTIES
 tclos : (ID<->ID) --> (ID<->ID) &
 !r.(r:(ID<->ID) => r <: tclos(r)) &
 !r.(r:(ID<->ID) => (r;tclos(r)) <: tclos(r))
VARIABLES rel1
INVARIANT
 rel1:ID <->ID
INITIALISATION rel1:={}
OPERATIONS
  Set(x,y) = PRE x:ID & y:ID THEN rel1 := rel1 \/ {x|->y} END;
  Close = BEGIN rel1 := tclos(rel1) END
END

