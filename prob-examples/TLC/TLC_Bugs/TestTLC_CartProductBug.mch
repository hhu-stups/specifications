MACHINE TestTLCBug
VARIABLES error
INVARIANT
 error = FALSE
INITIALISATION error := FALSE
OPERATIONS
  Set = IF {}*{1} = {1}*{} THEN /*TLC 1.4.7 reports this test to be false ! */
    error := FALSE
  ELSE
    error := TRUE
  END
END

