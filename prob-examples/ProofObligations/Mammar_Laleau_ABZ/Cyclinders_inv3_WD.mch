MACHINE Cylinders_inv3_WD
DEFINITIONS
 SET_PREF_SMT == TRUE;
 SET_PREF_CHR == TRUE;
 SET_PREF_DISPROVER_MODE == TRUE; /* avoid warning */
  "LibraryIO.def"
SETS PositionsDG = {fr,lft,rght}
CONSTANTS door_closed_p, door_cylinder_locked_p, door_open_p, gear_cylinder_locked_p, gear_extended_p, gear_retracted_p
,flag
PROPERTIES
(fr : dom(door_cylinder_locked_p) <=> flag=TRUE) &
 printf("flag=~w~n",flag) &
 not(
  !(po).(po : PositionsDG 
  =>  /*printf("po=~w~n",bool(po : dom(door_cylinder_locked_p))) &
      printf("door_cylinder_locked_p=~w~n",door_cylinder_locked_p) & */
       po : dom(door_cylinder_locked_p)  &  /* fast with {fr,lft,rght} */
  (/* door_cylinder_locked_p : PositionsDG +-> BOOL  & */ /* do we need a reification of partial function ? */
  (door_cylinder_locked_p(po) = TRUE => po : dom(door_closed_p) & door_closed_p : PositionsDG +-> BOOL)) )
) 
 &  /* Hypothesis: */ 
(PositionsDG = {fr}\/{rght}\/{lft} & {fr}/\{rght} = {} & {fr}/\{lft} = {} & {rght}/\{lft} = {})
 & /* Hypothesis: */ 
gear_extended_p : PositionsDG --> BOOL
 & /* Hypothesis: */ 
gear_retracted_p : PositionsDG --> BOOL
 & /* Hypothesis: */ 
!(po).(po : PositionsDG => not(gear_extended_p(po) = TRUE & gear_retracted_p(po) = TRUE))
 & /* Hypothesis: */ 
door_open_p : PositionsDG --> BOOL
 & /* Hypothesis: */ 
#(po1).(po1 : PositionsDG & 
        (gear_extended_p(po1) = FALSE & gear_retracted_p(po1) = FALSE => door_open_p = PositionsDG * {TRUE}))
 & /* Hypothesis: */ 
!(po).(po : PositionsDG => 
  po : dom(gear_extended_p) & 
  (gear_extended_p : PositionsDG +-> BOOL & 
  (gear_extended_p(po) = FALSE => po : dom(gear_retracted_p) & gear_retracted_p : PositionsDG +-> BOOL)))
 & /* Hypothesis: */ 
door_closed_p : PositionsDG --> BOOL
 & /* Hypothesis: */ 
!(po).(po : PositionsDG => not(door_open_p(po) = TRUE & door_closed_p(po) = TRUE))
 & /* Hypothesis: */ 
door_cylinder_locked_p : PositionsDG --> BOOL
 & /* Hypothesis: */ 
gear_cylinder_locked_p : PositionsDG --> BOOL
ASSERTIONS
 !(po).(po : PositionsDG 
  => po : dom(door_cylinder_locked_p) & 
  (door_cylinder_locked_p : PositionsDG +-> BOOL & 
  (door_cylinder_locked_p(po) = TRUE => po : dom(door_closed_p) & door_closed_p : PositionsDG +-> BOOL)))
END