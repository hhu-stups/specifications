MACHINE MammarLaleau_Failures_ReadDoors_inv8_selected
SETS
 ID={aa,bb}
CONSTANTS nextInputReadForDoorOpeningClosing, currentTime
PROPERTIES
 currentTime:INTEGER &
 nextInputReadForDoorOpeningClosing : NATURAL
ASSERTIONS
 {TRUE |-> 0,FALSE |-> nextInputReadForDoorOpeningClosing}(bool(currentTime = nextInputReadForDoorOpeningClosing)) : NATURAL
END

