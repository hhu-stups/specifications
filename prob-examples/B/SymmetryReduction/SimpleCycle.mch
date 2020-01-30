MACHINE SimpleCycle
SETS
 ID
CONSTANTS r
PROPERTIES
 r:ID<->ID & dom(r)=ID & ran(r)=ID & card(r) =  2
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx::ID
OPERATIONS
  Step(yy) = PRE yy:ID & xx|->yy:r & yy/=xx THEN xx:= yy END
END

