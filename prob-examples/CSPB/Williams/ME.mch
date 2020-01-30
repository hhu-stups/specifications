MACHINE ME /* MutualExclusion */
DEFINITIONS
ASSERT_LTL_1 == "(GF e(Enter.p1) => GF [Enter.p1]) & (FG e(Req.p1) => GF [Req.p1]) => GF [Enter.p1]";
ASSERT_LTL_2 == "SF(Enter.p1) & WF(Req.p1) => GF [Enter.p1]";
SETS
 AGENTS={p1,p2}
VARIABLES y
INVARIANT
 y:0..1 
INITIALISATION
 y:=1
OPERATIONS
  Req(nn) = PRE nn : AGENTS THEN skip END;
  Enter(nn) = PRE nn : AGENTS & y>0 THEN y := y-1 END;
  Leave(nn) = PRE nn : AGENTS THEN y := y+1 END

END