/*
* Taken from ClearSy - Modelling in B Tutorial
* see http://www.tools.clearsy.com/wp1/?page_id=161
*/

MACHINE measure
SEES ctx

OPERATIONS
   m1, m2 <-- measure_level =
   BEGIN
       m1 :: 0..TANK_CAPACITY ||
       m2 :: 0..TANK_CAPACITY
   END;

   m1, m2, m3 <-- measure_consumption =
   BEGIN
       m1 :: 0..MAX_CONSUMPTION ||
       m2 :: 0..MAX_CONSUMPTION ||
       m3 :: 0..MAX_CONSUMPTION
   END
END