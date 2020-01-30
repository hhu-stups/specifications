MACHINE ABZ_Lift
CONSTANTS
   highest, lowest
PROPERTIES
   highest : NATURAL
 & lowest : INTEGER
 & lowest < highest
/* & lowest = 0 & highest = 5 */
VARIABLES
   floor  
INVARIANT
   floor:INTEGER & floor : lowest..highest
INITIALISATION
   floor := lowest
OPERATIONS
   move_up =
     PRE floor < highest THEN
       floor := floor + 1
     END;
   move_down =
     PRE floor > lowest THEN
       floor := floor - 1
     END
END

