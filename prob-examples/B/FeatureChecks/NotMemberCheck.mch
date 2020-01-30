MACHINE NotMemberCheck
DEFINITIONS
 SET_PREF_MAXINT == 3;
 SET_PREF_MININT == -1; SET_PREF_CLPFD == TRUE;
 LAWS == (
     (INTEGER - {1,2}) - (INTEGER - {2,3,99}) = {3,99} &
     (INTEGER - {1,22}) \/ (INTEGER - {22,3,99}) = (INTEGER - {22}) &
     (INTEGER - ((INTEGER - {1,22,44}) \/ (INTEGER - {22,3,44,99})) = {44,22}) &
     (INTEGER - (INTEGER - {1,22})) \/ (INTEGER - {22,3,99}) = (INTEGER - {3,99})
 )
ASSERTIONS
  LAWS
VARIABLES xx
INVARIANT
 xx<:INTEGER
INITIALISATION xx:=INTEGER - {1,3}
OPERATIONS
  CheckSomeLaws = PRE LAWS THEN skip END;
  Add(x) = PRE x/:xx THEN xx := xx\/{x} END;
  AddPos(x) = PRE x/:xx & x>=0 THEN xx := xx\/{x} END;
  AddNeg(x) = PRE x/:xx & x<0 THEN xx := xx\/{x} END; 
  El(z) = PRE z:xx THEN skip END; 
  Remove(x) = PRE x:xx THEN xx := xx-{x} END;
  RemovePos(x) = PRE x:xx & x>=0 THEN xx := xx-{x} END;
  RemoveNeg(x) = PRE x:xx & x<0 THEN xx := xx-{x} END;
  Check(y) = PRE y: {x | x /: {0,1,2,3,4,5}} & y>0 & y>6 & y<9 THEN skip END 
END

