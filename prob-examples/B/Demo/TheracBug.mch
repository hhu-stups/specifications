REFINEMENT TheracBug

REFINES TheracBug

VARIABLES sw, safe, treatment_given

DEFINITIONS
   FaileSafeIsOn == (sw>0);
   TurnFailSafeOff == BEGIN sw := 0 END;
   TurnFailSafeOn == BEGIN sw := (sw + 1) mod 256 END;

INVARIANT
     sw : 0..255 & safe: BOOL & treatment_given: BOOL &
    (treatment_given=TRUE => safe=TRUE)
  
INITIALISATION
 sw,safe,treatment_given := 0,TRUE, FALSE
 
OPERATIONS
 StopTest = BEGIN TurnFailSafeOff END;
 SetUpTest =  BEGIN
              TurnFailSafeOn ;
                 IF FaileSafeIsOn THEN 
                    IF safe=TRUE THEN
                       treatment_given := TRUE
                    ELSE
                       treatment_given := FALSE
                    END
                 ELSE
                    treatment_given := TRUE
                 END
              END;
 
 ToggleSafe = BEGIN safe := bool(not(safe=TRUE)) || treatment_given := FALSE END
END