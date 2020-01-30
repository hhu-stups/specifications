MODEL
   NotGreaterThan
INCLUDES Semilattice
CONSTANTS lt, incomp
PROPERTIES
  lt: V<->V & lt = leq - id(V)  &
  incomp: V<->V & incomp = V*V - (leq \/ leq~)
ASSERTIONS
!(x,y).(x:V & y:V => (x|->y:lt <=> (x|->y:leq & x/=y))) ;
!(x,y).(x:V & y:V
                     => (x|->y:incomp <=> (x|->y/:leq & y|->x/:leq))) ;
  !(x,y).(x:V & y:V => ( not(y|->x:lt) <=> (x|->y:leq or x|->y:incomp)))
END