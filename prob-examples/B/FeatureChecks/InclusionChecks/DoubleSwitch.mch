MODEL
   DoubleSwitch
/* check what happens if the same machine (Switch) is included twice */
INCLUDES LightSwitch,Switch

OPERATIONS
  myToggle1 = toggle /* check whether this violates the invariant of LightSwitch */
END