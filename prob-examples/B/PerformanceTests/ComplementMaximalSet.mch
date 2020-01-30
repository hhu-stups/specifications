MACHINE ComplementMaximalSet
VARIABLES xx, yy
INVARIANT
  xx <: INTEGER & yy:xx
ASSERTIONS
 (INTEGER-(2..10)) /\ {10,11} = {11};
 {10,11} /\ (INTEGER-(2..10)) = {11};
 ((INTEGER-(2..10)) \/ {10,11}) = INTEGER-(2..9);
 (8..20) - (INTEGER-(2..10)) = {8,9,10};
 (INTEGER-(8..20)) \/ (INTEGER-(2..10)) = INTEGER-{8,9,10};
 (1..1000) - (INTEGER - (998..1002 \/ -500..10)) = {1,2,3,4,5,6,7,8,9,10,998,999,1000}
 /* LAW: X - (INTEGER-Y) = X /\ Y */
 /* does not work yet: (INTEGER-(8..20)) /\ (INTEGER-(2..10)) */
INITIALISATION xx:=INTEGER || yy:= 1
OPERATIONS
  Reset = BEGIN xx:=INTEGER END;
  SetToInterval = BEGIN xx:= 1..4 END; /*
  Remove(zz) = PRE zz:xx & zz/=yy THEN xx := xx-{zz} END; times out: to do: delay computation of RHS further */
  Remove3 = PRE 3/=yy & 3: xx THEN xx := xx-{3} END;
  Remove4 = PRE 4/=yy & 4: xx THEN xx := xx-{4} END;
  Add3 = PRE 3 /: xx THEN xx := xx \/ {3} END; 
  Add4 = PRE 4 /: xx THEN xx := xx \/ {4} END; 
  IncYY = PRE yy+1 : xx THEN yy:= yy+1 END;
  DecYY = PRE yy+1 /: xx THEN yy:= yy-1 END;
  r <-- CheckPF1 = IF {1|->2, 2|->3} : INTEGER +-> xx THEN r:=TRUE ELSE r:=FALSE END;
  r <-- CheckPF2 = IF {1|->2, 2|->2} : INTEGER +-> xx THEN r:=TRUE ELSE r:=FALSE END;
  r <-- CheckTF1 = IF {1|->2, 2|->3} : 1..2 +-> xx THEN r:=TRUE ELSE r:=FALSE END;
  r <-- CheckTF2 = IF {1|->2, 2|->2} : 1..2 +-> xx THEN r:=TRUE ELSE r:=FALSE END;
  c <-- GetCard = BEGIN c:= card(xx) END; /* should raise error if xx infinite */
  r <-- CompRanRestr = BEGIN r:= {1|->2, 2|->3, 3|->4} |> xx END
END

