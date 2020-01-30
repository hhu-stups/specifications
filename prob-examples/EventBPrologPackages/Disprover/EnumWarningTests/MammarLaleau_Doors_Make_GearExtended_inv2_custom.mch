MACHINE MammarLaleau_Doors_Make_GearExtended_inv2_custom
/* currently takes ProB a little bit (5-10 secs) to discover no counter-example exists */
/* ProB+Kodkod is instanenous */
SETS
 PositionsDG={lft,rht ,frnt}
 
DEFINITIONS
 SET_PREF_DISPROVER_MODE == TRUE; SET_PREF_SMT == TRUE; SET_PREF_CHR == TRUE;
 SET_PREF_TIME_OUT == 8000;
 GOAL ==  #(po0).(po0 : PositionsDG &
  ((gear_extended_p <+ {po |-> TRUE})(po0) = FALSE & gear_retracted_p(po0) = FALSE 
     =>
   door_open_p = PositionsDG * {TRUE}))
ASSERTIONS
   GOAL
CONSTANTS door_open_p, gear_extended_p, gear_retracted_p, po
PROPERTIES 
   /* Hypothesis: */ 
 #(po).(po : PositionsDG & (gear_extended_p(po) = FALSE & gear_retracted_p(po) = FALSE => door_open_p = PositionsDG * {TRUE}))
  & /* Hypothesis: */ 
 gear_extended_p : PositionsDG --> BOOL
  & /* Hypothesis: */ 
 po : dom(gear_retracted_p)
  & /* Hypothesis: */ 
 gear_retracted_p(po) = FALSE
  & /* Hypothesis: */ 
 !(po).(po : PositionsDG => not(gear_extended_p(po) = TRUE & gear_retracted_p(po) = TRUE))
  & /* Hypothesis: */ 
 !(po).(po : PositionsDG => po : dom(gear_extended_p) & (gear_extended_p : PositionsDG +-> BOOL & (gear_extended_p(po) = FALSE => po : dom(gear_retracted_p) & gear_retracted_p : PositionsDG +-> BOOL)))
  & /* Hypothesis: */ 
 /* gear_retracted_p : PositionsDG +-> BOOL 
  & */ /* Hypothesis: */ 
 gear_extended_p(po) = FALSE
  & /* Hypothesis: */ 
 (PositionsDG = {frnt}\/{rht}\/{lft} & {frnt}/\{rht} = {} & {frnt}/\{lft} = {} & {rht}/\{lft} = {})
  & /* Hypothesis: */ 
 /* truth */ (po : PositionsDG => po : dom(gear_extended_p) & gear_extended_p : PositionsDG +-> BOOL)
  & /* Hypothesis: */ 
 gear_retracted_p : PositionsDG --> BOOL
  & /* Hypothesis: */ 
 door_open_p : PositionsDG --> BOOL
  &  /* Hypothesis:   THIS HYPOTHESIS TAKES A LOT OF TIME ! */
 !(po0).(po0 : PositionsDG =>
   po0 : dom(gear_extended_p <+ {po |-> TRUE}) 
    &
   gear_extended_p <+ {po |-> TRUE} : PositionsDG +-> BOOL /* this is expensive */
   &
   ((gear_extended_p <+ {po |-> TRUE})(po0) = FALSE
      => po0 : dom(gear_retracted_p) & 
         gear_retracted_p : PositionsDG +-> BOOL)
    
    )

/* */
 & not(GOAL)
END