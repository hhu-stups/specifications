MACHINE DefSetPartTest2
DEFINITIONS
 SET_PREF_MAX_INITIALISATIONS == 73;
 GOAL == aa:P1 & bb:P2 & xx:P2 & xx /= bb & card(P1)=2
SETS
 ID
CONSTANTS aa,bb, xx,   P1, P2
PROPERTIES
 {aa,bb,xx} <: ID &
 aa /= bb &

 P1 \/ P2 = ID & P1 /\ P2 = {}

& card(ID) = 5
ASSERTIONS
 {aa,bb,xx} <: P1 \/ P2
OPERATIONS // should all be covered:
  Test1 = PRE aa:P1 & bb:P2 & xx:P2 & xx /= bb & card(P1)=1 THEN skip END;
  Test2 = PRE aa:P1 & bb:P2 & xx:P2 & xx /= bb & card(P1)=2 THEN skip END;
  Test3 = PRE aa:P1 & bb:P2 & xx:P2 & xx = bb & card(P1)=1 THEN skip END;
  Test4 = PRE aa:P1 & bb:P2 & xx:P2 & xx = bb & card(P1)=2 THEN skip END;
  Test5 = PRE aa:P1 & bb:P2 & xx:P1 & xx = aa & card(P1)=1 THEN skip END;
  Test6 = PRE aa:P1 & bb:P2 & xx:P1 & xx = aa & card(P1)=2 THEN skip END;
  Test7 = PRE aa:P1 & bb:P1 & xx:P1 & xx = aa & card(P1)=2 THEN skip END;
  Test8 = PRE aa:P1 & bb:P1 & xx:P1 & xx /= aa & card(P1)=2 THEN skip END;
  Test9 = PRE aa:P2 & bb:P2 & xx:P1 & xx /= aa & card(P1)=2 THEN skip END;
  Test10 = PRE aa:P2 & bb:P2 & xx:P1 & xx /= aa & card(P1)=2 THEN skip END
END

