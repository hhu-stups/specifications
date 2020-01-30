MACHINE           BirthandDeath

SETS              PERSON; SEX = {boy, girl}

VARIABLES         male, female

INVARIANT         male <: PERSON & female <: PERSON & male /\ female = {}

INITIALISATION    male := {} || female := {}

OPERATIONS
/*    nn : PERSON & nn /: (male \/ female) & ss : SEX
 */
  born(nn,ss) =
  PRE
    nn : PERSON  & ss : SEX  & nn /: (male \/ female) 
  THEN
    IF ss = boy 
    THEN male := male \/ {nn}
    ELSE female := female \/ {nn}
    END
  END;

  dies(nn) =
  PRE
    nn : PERSON & nn : (male \/ female)
  THEN
    IF nn : male 
    THEN male := male - {nn} 
    ELSE female := female - {nn}
    END
  END

END
