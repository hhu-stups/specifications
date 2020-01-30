MACHINE BecomeElementEnablingTest
SETS
 ID={aa,bb,cc}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx<:ID
INITIALISATION xx:={}
OPERATIONS
  Add(yy) = PRE yy:ID THEN xx:= xx \/ {yy} END;
  ContainsIv = PRE iv:xx THEN skip END;
  r <-- PickOne = BEGIN r :: xx END;
  IsEmpty = SELECT xx={} THEN skip END;
  AddIv = SELECT iv /: xx THEN xx:= xx\/ {iv} END;
  Infeas = SELECT aa /: xx & bb/: xx & cc/:xx & xx/={} THEN xx := {} END;
  IsEmpty2 = SELECT card(xx)=0 THEN xx := {} END;
  ChoiceTest = CHOICE  SELECT xx={} THEN xx := {iv} END OR SELECT xx/={} THEN xx:={} END END;
  LETTest = LET y BE y= xx \/ {iv} IN SELECT xx=y THEN xx:= y END END
END