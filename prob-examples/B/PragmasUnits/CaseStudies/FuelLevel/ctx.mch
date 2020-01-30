/*
* Taken from ClearSy - Modelling in B Tutorial
* see http://www.tools.clearsy.com/wp1/?page_id=161
*/

MACHINE ctx

SETS
   tSTATUS = {NOMINAL, LOW_LEVEL}

CONSTANTS
   /*@ unit "l" */ TANK_CAPACITY,       /* max quantity of fuel in the tank */
   MAX_CONSUMPTION,                   /* max quantity of fuel consumed in a cycle */
   WARNING_CAPACITY                   /* low fuel level */

PROPERTIES
   TANK_CAPACITY : NAT1 &
   MAX_CONSUMPTION : NAT1 &
   WARNING_CAPACITY : NAT1 &
   MAX_CONSUMPTION < TANK_CAPACITY &
   WARNING_CAPACITY < TANK_CAPACITY
END
