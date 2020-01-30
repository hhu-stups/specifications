MODEL
   Double3
INCLUDES LightSwitchSees,Switch
OPERATIONS
  toggle3 = BEGIN ToggleLightSwitch || toggle END;
  ison = PRE light=TRUE THEN skip END;
  isoff = PRE light=FALSE THEN skip END
END