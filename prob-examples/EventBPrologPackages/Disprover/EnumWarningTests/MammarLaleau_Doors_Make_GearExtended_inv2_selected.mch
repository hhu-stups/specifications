MACHINE MammarLaleau_Doors_Make_GearExtended_inv2_selected
/* currently takes ProB quite a while (10-20 secs) to discover no counter-example exists */
/* ProB+Kodkod is instanenous */
SETS
 PositionsDG={lft,rht ,frnt}
 
DEFINITIONS
 SET_PREF_DISPROVER_MODE == TRUE; SET_PREF_SMT == TRUE; SET_PREF_CHR == TRUE;
 SET_PREF_TIME_OUT == 10000;
 GOAL ==  #(po0).(po0 : PositionsDG &
  ((gear_extended_p <+ {po |-> TRUE})(po0) = FALSE & gear_retracted_p(po0) = FALSE 
     =>
   door_open_p = PositionsDG * {TRUE}))
ASSERTIONS
   GOAL
CONSTANTS door_open_p, gear_extended_p, gear_retracted_p, po
PROPERTIES 
/* with those assumptions ProB finds inconsistency much faster : */
/* gear_extended_p : PositionsDG --> BOOL &
   gear_retracted_p : PositionsDG --> BOOL &
   door_open_p : PositionsDG --> BOOL &
 */
 

 po: PositionsDG &

/* Hypothesis: */ 
gear_extended_p(po) = FALSE

 & /* Hypothesis: */ 
#(po).(po : PositionsDG & 
 (gear_extended_p(po) = FALSE & gear_retracted_p(po) = FALSE => door_open_p = PositionsDG * {TRUE}))

 & /* Hypothesis: */ 
gear_retracted_p(po) = FALSE

 & not(GOAL)
END