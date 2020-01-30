MACHINE DefSetWithConstantsTest
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 100
SETS
 ID; Enum = {e1,e2}
CONSTANTS aa,bb,cc,dd, f
PROPERTIES
  aa:ID & bb:ID & cc:ID & dd:ID & bb/=cc & card(ID) = 4 &
  f : ID --> ID &
  !x.(x:ID => f(x) = x)
END

