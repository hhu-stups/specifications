/*
* Taken from ClearSy - Modelling in B Tutorial
* see http://www.tools.clearsy.com/wp1/?page_id=161
*/

MACHINE fuel0
SEES
   ctx
VARIABLES
   estimated_level,
   estimated_consumption,
   status
INVARIANT
   /* Typing */
   estimated_level : 0..TANK_CAPACITY &
   estimated_consumption : 0 ..MAX_CONSUMPTION &
   status : tSTATUS &
   /* Security property */
   (estimated_level <= WARNING_CAPACITY => status = LOW_LEVEL)
INITIALISATION
   estimated_level := 0 ||
   estimated_consumption := 0 ||
   status := LOW_LEVEL
OPERATIONS
   compute_initial_level =
   BEGIN
       estimated_level, status :(
           estimated_level: 0..TANK_CAPACITY &
           status : tSTATUS &
           (estimated_level <= WARNING_CAPACITY => status = LOW_LEVEL))
   END
;
   compute_remaining_fuel =
   BEGIN
       estimated_level, estimated_consumption, status :(
           estimated_level: 0..TANK_CAPACITY &
           estimated_consumption : 0..MAX_CONSUMPTION &
           status : tSTATUS &
           (estimated_level <= estimated_level$0) &
           (estimated_level <= WARNING_CAPACITY => status = LOW_LEVEL))
   END
END