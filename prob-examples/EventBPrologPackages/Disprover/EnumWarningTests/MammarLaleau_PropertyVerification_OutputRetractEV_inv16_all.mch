MACHINE MammarLaleau_PropertyVerification_OutputRetractEV_inv16_selected
SETS
 PositionsDG={lft,rht ,frnt};
 MV = {up,down};
 ST  = {open, closed}
 
DEFINITIONS
 GOAL == currentTime > currentTime + 70 & retract_EV_value = TRUE => anomaly = TRUE or gear_extended_ind = PositionsDG * {FALSE}
ASSERTIONS
   GOAL
CONSTANTS retract_EV_value, handler_ind, gear_retracted_ind, open_EV, extend_EV, door_open_ind,
gear_shock_absorber_ind, currentTime, TimeStimulationExtendRetractEv, retract_EV,
allowedStartRetractEv, anomaly, gear_extended_ind,

nextInputReadForDoorOpeningClosing, door_cylinder_locked_p, deadlineOpenCloseDoors,
Intermediate1, Intermediate2, PositionsHandler,
TimeStimulationOpenCloseEv,
Unchanged20s, allowedStartCloseEv, allowedStartExtendEv,
 PositionsSwitch,
 allowedStartOpenEv,
 allowedStopGeneralEv,
 analogical_switch_p,
 close_EV,
 deadlineGearsRetractingExtending,
 deadlineStimulationGeneralEv,
 deadlineStimulationOpenCloseEv,
 deadlineStimulationRetractExtendEv,
 deadlineSwitch,
 deadlineUnlockLockDoorsCylinders,
 deadlineUnlockLockGearsCylinders,
 door_closed_ind, door_closed_p, door_cylinder_fail, door_open_p,
 end_cycle, gear_cylinder_fail, gear_cylinder_locked_p,
 gear_extended_p, gear_retracted_p, gear_shock_absorber_p,
 stayUp, stayDown, nextInputReadForOpenSwitch,
 nextInputReadForGearStartExtendingRetracting,
 nextInputReadForPressurizedcircuit, general_EV,
 nextInputReadForClosedSwitch,
 nextInputReadForGearEndExtendingRetracting

PROPERTIES 
 
/* Hypothesis: */ 
 nextInputReadForDoorOpeningClosing = 0 & close_EV = TRUE => anomaly = TRUE or door_closed_ind = PositionsDG * {TRUE}
  & /* Hypothesis: */ 
 extend_EV = TRUE or retract_EV = TRUE => open_EV = TRUE
  & /* Hypothesis: */ 
 gear_cylinder_locked_p : PositionsDG --> BOOL
  & /* Hypothesis: */ 
 handler_ind = up => stayDown = FALSE


  & /* Hypothesis: */ 
 nextInputReadForGearStartExtendingRetracting = 0 & retract_EV = TRUE => anomaly = TRUE or gear_extended_ind = PositionsDG * {FALSE}


  & /* Hypothesis: */ 
 door_cylinder_locked_p : PositionsDG --> BOOL
  & /* Hypothesis: */ 
 deadlineGearsRetractingExtending : PositionsDG --> NATURAL
  & /* Hypothesis: */ 
 deadlineStimulationRetractExtendEv : NATURAL
  & /* Hypothesis: */ 
 deadlineOpenCloseDoors : PositionsDG --> NATURAL
  & /* Hypothesis: */ 
 (PositionsDG = {frnt}\/{rht}\/{lft} & {frnt}/\{rht} = {} & {frnt}/\{lft} = {} & {rht}/\{lft} = {})
  & /* Hypothesis: */ 
 allowedStopGeneralEv : NATURAL
  & /* Hypothesis: */ 
 open_EV = TRUE or (close_EV = TRUE or (extend_EV = TRUE or retract_EV = TRUE)) => general_EV = TRUE
  & /* Hypothesis: */ 
 currentTime > TimeStimulationExtendRetractEv + 100 & extend_EV = TRUE => nextInputReadForGearEndExtendingRetracting = 0
  & /* Hypothesis: */ 
 Intermediate2 = TRUE => analogical_switch_p = open
  & /* Hypothesis: */ 
 currentTime >= allowedStartRetractEv
  & /* Hypothesis: */ 
 deadlineStimulationGeneralEv : NATURAL
  & /* Hypothesis: */ 
 not(
     Intermediate1 = TRUE
     &
     Intermediate2 = TRUE
 )

  & /* Hypothesis: */ 
 deadlineUnlockLockDoorsCylinders : PositionsDG --> NATURAL


  & /* Hypothesis: */ 
 door_open_ind : PositionsDG --> BOOL
  & /* Hypothesis: */ 
 #(po).(po : PositionsDG & (gear_extended_p(po) = FALSE & gear_retracted_p(po) = FALSE => door_open_p = PositionsDG * {TRUE}))

  & /* Hypothesis: */ 
 nextInputReadForGearEndExtendingRetracting = 0 & retract_EV = TRUE => anomaly = TRUE or gear_retracted_ind = PositionsDG * {TRUE}
  & /* Hypothesis: */ 
 stayUp = TRUE & end_cycle = TRUE => extend_EV = FALSE

  & /* Hypothesis: */ 
 (PositionsHandler = {up}\/{down} & {up}/\{down} = {})


  & /* Hypothesis: */ 
 retract_EV_value = bool(handler_ind = up & (gear_retracted_ind /= PositionsDG * {TRUE} & (open_EV = TRUE & (extend_EV = FALSE & (door_open_ind = PositionsDG * {TRUE} & gear_shock_absorber_ind = PositionsDG * {FALSE})))))

  & /* Hypothesis: */ 
 !(po).(po : PositionsDG => not(door_open_p(po) = TRUE & door_closed_p(po) = TRUE))


  & /* Hypothesis: */ 
 deadlineSwitch : NATURAL
  & /* Hypothesis: */ 
 currentTime > TimeStimulationOpenCloseEv + 70 & close_EV = TRUE => anomaly = TRUE or door_closed_ind = PositionsDG * {TRUE}
  & /* Hypothesis: */ 
 currentTime > TimeStimulationExtendRetractEv + 100 & retract_EV = TRUE => anomaly = TRUE or gear_retracted_ind = PositionsDG * {TRUE}
  & /* Hypothesis: */ 
 nextInputReadForGearEndExtendingRetracting = 0 & extend_EV = TRUE => anomaly = TRUE or gear_extended_ind = PositionsDG * {TRUE}

  & /* Hypothesis: */ 
 !(po).(po : PositionsDG => not(gear_extended_ind(po) = TRUE & gear_retracted_ind(po) = TRUE))
  & /* Hypothesis: */ 
 currentTime > TimeStimulationOpenCloseEv + 70 & close_EV = TRUE => nextInputReadForDoorOpeningClosing = 0
  & /* Hypothesis: */ 
 !(po).(po : PositionsDG => not(gear_extended_p(po) = TRUE & gear_retracted_p(po) = TRUE))
  & /* Hypothesis: */ 
 currentTime : NATURAL
  & /* Hypothesis: */ 
 allowedStartExtendEv : NATURAL
  & /* Hypothesis: */ 
 nextInputReadForOpenSwitch : NATURAL


  & /* Hypothesis: */ 
 gear_shock_absorber_ind : PositionsDG --> BOOL

  & /* Hypothesis: */ 
 deadlineUnlockLockGearsCylinders : PositionsDG --> NATURAL
  & /* Hypothesis: */ 
 door_cylinder_fail : PositionsDG --> BOOL
 &
 gear_cylinder_fail : PositionsDG --> BOOL
  & /* Hypothesis: */ 
 door_open_p : PositionsDG --> BOOL

  & /* Hypothesis: */ 
 nextInputReadForGearStartExtendingRetracting /= 0 => nextInputReadForGearStartExtendingRetracting = TimeStimulationExtendRetractEv + 70

  & /* Hypothesis: */ 
 gear_extended_p : PositionsDG --> BOOL
  & /* Hypothesis: */ 
 nextInputReadForPressurizedcircuit : NATURAL


  & /* Hypothesis: */ 
 gear_extended_ind : PositionsDG --> BOOL
  & /* Hypothesis: */ 
 handler_ind = down => stayUp = FALSE
  & /* Hypothesis: */ 
 !(po).(po : PositionsDG & gear_shock_absorber_p(po) = TRUE => gear_extended_p(po) = TRUE)


  & /* Hypothesis: */ 
 currentTime > TimeStimulationExtendRetractEv + 70 & retract_EV = TRUE => anomaly = TRUE or gear_extended_ind = PositionsDG * {FALSE}
  & /* Hypothesis: */ 
 currentTime > TimeStimulationExtendRetractEv + 100 & extend_EV = TRUE => anomaly = TRUE or gear_extended_ind = PositionsDG * {TRUE}
  & /* Hypothesis: */ 
 !(po).(po : PositionsDG => not(door_closed_ind(po) = TRUE & door_open_ind(po) = TRUE))
  & /* Hypothesis: */ 
 not(
     open_EV = TRUE
     &
     close_EV = TRUE
 )
  & /* Hypothesis: */ 
 not(
     extend_EV = TRUE
     &
     retract_EV = TRUE
 )
  & /* Hypothesis: */ 
 nextInputReadForDoorOpeningClosing : NATURAL
  & /* Hypothesis: */ 
 allowedStartCloseEv : NATURAL
  & /* Hypothesis: */ 
 nextInputReadForClosedSwitch : NATURAL
  & /* Hypothesis: */ 
 gear_retracted_p : PositionsDG --> BOOL
  & /* Hypothesis: */ 
 !(po).(po : PositionsDG & gear_cylinder_locked_p(po) = TRUE => gear_extended_p(po) = TRUE or gear_retracted_p(po) = TRUE)

  & /* Hypothesis: */ 
 !(po).(po : PositionsDG & gear_cylinder_locked_p(po) = FALSE => door_open_p = PositionsDG * {TRUE})
  & /* Hypothesis: */ 
 door_closed_p : PositionsDG --> BOOL

  & /* Hypothesis: */ 
 gear_shock_absorber_p : PositionsDG --> BOOL
  & /* Hypothesis: */ 
 allowedStartRetractEv : NATURAL
  & /* Hypothesis: */ 
 nextInputReadForDoorOpeningClosing /= 0 => nextInputReadForDoorOpeningClosing = TimeStimulationOpenCloseEv + 70
  & /* Hypothesis: */ 
 nextInputReadForDoorOpeningClosing = 0 & open_EV = TRUE => anomaly = TRUE or door_open_ind = PositionsDG * {TRUE}
  & /* Hypothesis: */ 
 gear_retracted_ind : PositionsDG --> BOOL
  & /* Hypothesis: */ 
 door_closed_ind : PositionsDG --> BOOL
  & /* Hypothesis: */ 
 TimeStimulationOpenCloseEv : NATURAL
 &
 TimeStimulationExtendRetractEv : NATURAL
  & /* Hypothesis: */ 
 currentTime > TimeStimulationOpenCloseEv + 70 & open_EV = TRUE => anomaly = TRUE or door_open_ind = PositionsDG * {TRUE}
  & /* Hypothesis: */ 
 !(po).(po : PositionsDG & door_cylinder_locked_p(po) = TRUE => door_closed_p(po) = TRUE)

  & /* Hypothesis: */ 
 allowedStartOpenEv : NATURAL

  & /* Hypothesis: */ 
 nextInputReadForGearEndExtendingRetracting : NATURAL
  & /* Hypothesis: */ 
 currentTime > TimeStimulationExtendRetractEv + 100 & retract_EV = TRUE => nextInputReadForGearEndExtendingRetracting = 0
  & /* Hypothesis: */ 
 currentTime > TimeStimulationOpenCloseEv + 70 & open_EV = TRUE => nextInputReadForDoorOpeningClosing = 0
  & /* Hypothesis: */ 
 !(po).(po : PositionsDG => po : dom(gear_extended_p) & (gear_extended_p : PositionsDG +-> BOOL & (gear_extended_p(po) = FALSE => po : dom(gear_retracted_p) & gear_retracted_p : PositionsDG +-> BOOL)))
  & /* Hypothesis: */ 
 retract_EV /= retract_EV_value
  & /* Hypothesis: */ 
 stayDown = TRUE & end_cycle = TRUE => retract_EV = FALSE
  & /* Hypothesis: */ 
 nextInputReadForGearStartExtendingRetracting : NATURAL
  & /* Hypothesis: */ 
 currentTime > TimeStimulationExtendRetractEv + 70 & extend_EV = TRUE => anomaly = TRUE or gear_retracted_ind = PositionsDG * {FALSE}
  & /* Hypothesis: */ 
 (PositionsSwitch = {open}\/{closed} & {open}/\{closed} = {})
  & /* Hypothesis: */ 
 deadlineStimulationOpenCloseEv : NATURAL
  & /* Hypothesis: */ 
 nextInputReadForGearStartExtendingRetracting = 0 & extend_EV = TRUE => anomaly = TRUE or gear_retracted_ind = PositionsDG * {FALSE}
  & /* Hypothesis: */ 
 !(po).(po : PositionsDG & gear_shock_absorber_p(po) = TRUE => gear_extended_p(po) = TRUE)
  & /* Hypothesis: */ 
 Unchanged20s : NATURAL
  & /* Hypothesis: */ 
 nextInputReadForGearEndExtendingRetracting /= 0 => nextInputReadForGearEndExtendingRetracting = TimeStimulationExtendRetractEv + 100
  & /* Hypothesis: */ 
 Intermediate1 = TRUE => analogical_switch_p = open

 & not(GOAL)
END