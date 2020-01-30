MACHINE FuzzySets
SETS
 El
DEFINITIONS
 One == 4;
 FuzzySet == El --> 0..One;
 Empty == %x.(x:El|0) 
VARIABLES A,B
INVARIANT
 A:FuzzySet & B:FuzzySet
INITIALISATION A := Empty || B := Empty
OPERATIONS

  r <-- SupportA = r := {x|x:El & A(x)>0};
  r <-- CoreA = r := {x|x:El & A(x)=One};
  r <-- HeightA = r := max(ran(A));
  ASubsetEqB = SELECT !x.(x:El => A(x) <= B(x)) THEN skip END;
  BSubsetEqA = SELECT !x.(x:El => B(x) <= A(x)) THEN skip END;

  SetA(el,ms) = PRE el:El & ms:0..One & A(el) /= ms THEN
     A(el) := ms
  END;
  SetB(el,ms) = PRE el:El & ms:0..One & A(el) /= ms  THEN
     B(el) := ms
  END
END

