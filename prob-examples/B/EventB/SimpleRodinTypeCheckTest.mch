MACHINE SimpleRodinTypeCheckTest
SETS
 Sensor
DEFINITIONS
 scope_Sensor == 1..2
CONSTANTS on,off
PROPERTIES
 Sensor = {on,off}
VARIABLES xx
INVARIANT
 xx:Sensor
INITIALISATION xx:=off
OPERATIONS
  Set(yy) = PRE yy:Sensor THEN xx:= yy END
END

