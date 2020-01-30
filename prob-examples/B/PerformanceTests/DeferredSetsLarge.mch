MACHINE DeferredSetsLarge
SETS
 AA;BB 
PROPERTIES
 card(AA) = 100 & card(BB)=100
VARIABLES xx,yy
INVARIANT
 xx:AA & yy:BB
INITIALISATION xx::AA || yy::BB
OPERATIONS
  rx,ry <--  Get = BEGIN rx,ry:= xx,yy END;
  Set(py) = PRE py:AA & py /= xx THEN xx:= py END
END

