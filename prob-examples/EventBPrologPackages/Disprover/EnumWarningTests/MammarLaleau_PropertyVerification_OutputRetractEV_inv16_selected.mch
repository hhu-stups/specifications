MACHINE MammarLaleau_PropertyVerification_OutputRetractEV_inv16_selected
SETS
 PositionsDG={lft,rht ,frnt};
 MV = {up,down}
 
DEFINITIONS
 GOAL == currentTime > currentTime + 70 & retract_EV_value = TRUE => anomaly = TRUE or gear_extended_ind = PositionsDG * {FALSE}
ASSERTIONS
   GOAL
CONSTANTS retract_EV_value, handler_ind, gear_retracted_ind, open_EV, extend_EV, door_open_ind,
gear_shock_absorber_ind, currentTime, TimeStimulationExtendRetractEv, retract_EV,
allowedStartRetractEv, anomaly, gear_extended_ind

PROPERTIES 
 
 /* Hypothesis: */ 
 retract_EV_value = bool(handler_ind = up & (gear_retracted_ind /= PositionsDG * {TRUE} & (open_EV = TRUE & (extend_EV = FALSE & (door_open_ind = PositionsDG * {TRUE} & gear_shock_absorber_ind = PositionsDG * {FALSE})))))
  & /* Hypothesis: */ 
 currentTime > TimeStimulationExtendRetractEv + 70 & retract_EV = TRUE => anomaly = TRUE or gear_extended_ind = PositionsDG * {FALSE}
  & /* Hypothesis: */ 
 retract_EV /= retract_EV_value
  & /* Hypothesis: */ 
 currentTime >= allowedStartRetractEv

 & not(GOAL)
END