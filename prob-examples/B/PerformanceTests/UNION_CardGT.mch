MACHINE UNION_CardGT
// test whether the check card(speedLimitAreasInMA) > 20
// leads to a complicated unification between the result of D_SpeedLimitAreasOfMA(LV_ma)
// and a potential list skeleton set up by card(speedLimitAreasInMA) > 20
DEFINITIONS
 "LibraryStrings.def"; 
  SET_PREF_SMT == TRUE  // currently this treatment is only successful in SMT mode
CONSTANTS
V_MAsFound, D_SpeedLimitAreasOfMA, V_TO_STR
PROPERTIES
  V_MAsFound = 1..5 &
  D_SpeedLimitAreasOfMA = [ {}, {1}, 1..10 , 2..5, 1..30] &
  V_TO_STR = ["eins", "zwei", "drei", "vier", "fuenf"]
VARIABLES 
LV_SpeedLimitAreasErrors
INVARIANT 
  LV_SpeedLimitAreasErrors: POW(STRING)
INITIALISATION
 
          LV_SpeedLimitAreasErrors :=
            UNION(LV_ma, speedLimitAreasInMA).(LV_ma : V_MAsFound
                & speedLimitAreasInMA = D_SpeedLimitAreasOfMA(LV_ma)
                & speedLimitAreasInMA : POW(INTEGER)
                & card(speedLimitAreasInMA) > 20 //C_MaxNumberSpeedLimitAreasWithinMA
                |
                  {FORMAT_TO_STRING(
                      "MA starting a BaliseGroup ~w contains to many SpeedLimitAreas (~w)"
 //                     , [V_TO_STR(LV_ma), TO_STRING((speedLimitAreasInMA))])
                      , [TO_STRING(LV_ma), STRING_APPEND(" ",TO_STRING((speedLimitAreasInMA)))])
                  }
              )
OPERATIONS
  ErrMsg(x) = SELECT x:LV_SpeedLimitAreasErrors THEN skip END
END