MODEL
   PaperroundIF
SETS HOUSE
CONSTANTS
  lasth
PROPERTIES lasth:HOUSE
VARIABLES mag,pap
INVARIANT pap <: HOUSE & mag <: pap & lasth /: mag
INITIALISATION
  pap := {} || mag := {}
OPERATIONS
  remif(hh) = PRE hh:HOUSE THEN
    IF hh=lasth THEN
        pap := pap - {hh}
    ELSE
        mag := mag - {hh}
    END
  END
END