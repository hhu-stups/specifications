
MACHINE TestBugly
DEFINITIONS
  FORMAT_TO_STRING(S,List) == "0";
  EXTERNAL_FUNCTION_FORMAT_TO_STRING(X) == ((STRING*seq(X)) --> STRING);
CONCRETE_CONSTANTS
  aa0,
  aa1,
  aa2,
  aa3,
  aa4,
  aa5
PROPERTIES
    aa0 : STRING
  & aa1 : STRING
  & aa2 : STRING
  & aa3 : POW(STRING * seq(STRING) * STRING * STRING)
  & aa4 : POW(seq(STRING) * STRING * STRING)
  & aa5 : POW(seq(STRING) * STRING * STRING)
  & aa0 = aa5(["aa6"] |-> aa4(["aa7"] |-> "aa8"))
  & aa1 = "aa9 ~w ~w"
  & aa2 = "aa10 ~w ~w"
  & aa3 = /*@symbolic */ %(aa11,aa12,aa13).(aa11 : STRING & aa13 : STRING & aa12 : seq(STRING)|FORMAT_TO_STRING(aa11,aa12 <- aa13))
  & aa4 = /*@symbolic */ %(aa14,aa15).(aa15 : STRING & aa14 : seq(STRING)|aa3(aa1 |-> aa14 |-> aa15))
  & aa5 = /*@symbolic */ %(aa16,aa17).(aa17 : STRING & aa16 : seq(STRING)|aa3(aa1 |-> aa16 |-> aa17))
INITIALISATION
    skip
END
