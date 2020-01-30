MACHINE MammarLaleau_Cylinders_LockGearCylinder_inv4_selected
SETS
 PositionsDG={lft,rht ,frnt}
 
DEFINITIONS
 GOAL == !(po0).(po0 : PositionsDG & 
 (gear_cylinder_locked_p <+ {po |-> TRUE})(po0) = TRUE
   => 
  (gear_extended_p(po0) = TRUE or gear_retracted_p(po0) = TRUE))
ASSERTIONS
   GOAL
CONSTANTS gear_cylinder_locked_p, gear_extended_p, gear_retracted_p, po

PROPERTIES 

 po: PositionsDG &
 
 /* By adding these three (total fun or partial fun) we find contradiction very quickly : */
 /* Without them; it takes very long !! */
 /* gear_cylinder_locked_p : PositionsDG +-> BOOL &
 gear_extended_p : PositionsDG +-> BOOL &
 gear_retracted_p : PositionsDG +-> BOOL & */

/* USE DISPROVER_MODE to efficiently check this machine */

 /* Hypothesis: */ 
 gear_cylinder_locked_p(po) = FALSE
 
  & /* Hypothesis: */ 
(   gear_extended_p(po) = TRUE
   or
   gear_retracted_p(po) = TRUE )
   
  & /* Hypothesis: */ 
 !(po1).(po1 : PositionsDG & 
         gear_cylinder_locked_p(po1) = TRUE
          => (gear_extended_p(po1) = TRUE or gear_retracted_p(po1) = TRUE))

 & not(GOAL)
END