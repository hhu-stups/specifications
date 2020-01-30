MACHINE DefSetWithConstantsTest3
/* Test new static MACE style symmetry reduction */
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 1000
SETS
 ID; Enum = {e1,e2}
CONSTANTS aa,bb,cc,dd,  s1, s2
PROPERTIES
  aa:ID & bb:ID & cc:ID & dd:ID & card(ID) = 20 &
  s1 = {aa,bb} & s2 = {cc,dd} &
  card(s1) = card(s2) 
ASSERTIONS
 not( card({aa,cc}) > card({bb,dd}) & s1 /\ s2 = {} )
END

