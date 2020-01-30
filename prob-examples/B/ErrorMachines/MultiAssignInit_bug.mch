MACHINE MultiAssignInit_bug
SETS
 DOOR = {opened,closed};
 FLOORS = {E0,E1,E2}
CONSTANTS
 SENSORS
PROPERTIES
 SENSORS = POW(FLOORS)

VARIABLES
 door, floor, sensor

INVARIANT 
 door : DOOR & floor : FLOORS & sensor : SENSORS 

INITIALISATION
 door := closed || door := opened ||  floor := E0 || sensor := {}

OPERATIONS 
 openDOOR = PRE door = closed THEN door := opened END;
 closeDOOR = PRE door = opened THEN door := closed END;
 

 moveLift(p) = PRE p : FLOORS & door = closed THEN floor := p END /* ;

 reinit = BEGIN door := closed || door := opened ||  floor := E0 || sensor := {} END */
END
