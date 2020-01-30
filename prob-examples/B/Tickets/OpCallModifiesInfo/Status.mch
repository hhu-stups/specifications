MACHINE Status
VARIABLES status
INVARIANT
 status : BOOL
INITIALISATION status := TRUE
OPERATIONS
  Toggle = IF status = TRUE THEN status := FALSE ELSE status := TRUE END;
  Toggle2 = BEGIN status := bool(status=FALSE) END
END

