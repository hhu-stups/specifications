MODEL
   LightSwitch
INCLUDES Switch
VARIABLES light
INVARIANT light:BOOL & ((light=TRUE) <=> (curStatus=on))
INITIALISATION light :=  bool(curStatus=on)
OPERATIONS
  ToggleLightSwitch = BEGIN
       light := bool(light=FALSE) ||
       toggle
   END
END