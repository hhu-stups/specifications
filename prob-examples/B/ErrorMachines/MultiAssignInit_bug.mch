MACHINE MultiAssignInit_bug
SETS
 DOOR = {opened,closed};
 FLOORS = {E0,E1,E2}
CONSTANTS
 SENSORS
PROPERTIES
 SENSORS = POW(FLOORS)

VARIABLES
 door, lfloor, sensor

INVARIANT
 door : DOOR & lfloor : FLOORS & sensor : SENSORS

INITIALISATION
 door := closed || door := opened ||  lfloor := E0 || sensor := {}

OPERATIONS
 openDOOR = PRE door = closed THEN door := opened END;
 closeDOOR = PRE door = opened THEN door := closed END;


 moveLift(p) = PRE p : FLOORS & door = closed THEN lfloor := p END /* ;

 reinit = BEGIN door := closed || door := opened ||  lfloor := E0 || sensor := {} END */
END
