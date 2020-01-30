MODEL
   PaperroundAny
SETS HOUSE
CONSTANTS
  lasth
PROPERTIES lasth:HOUSE
VARIABLES mag,pap
INVARIANT pap <: HOUSE & mag <: pap & lasth /: mag
INITIALISATION
  pap := {} || mag := {}
OPERATIONS
  addmagany = PRE lasth /: pap THEN
    ANY hh WHERE hh:pap /* & hh /: pap*/
    THEN
        mag := mag \/ {hh}
    END
  END
END