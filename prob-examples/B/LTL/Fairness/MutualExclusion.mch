MACHINE MutualExclusion
DEFINITIONS
ASSERT_LTL_1 == "SF(Enter1) & WF(Req1) => GF([Enter1])";
ASSERT_LTL_2 == "SF(Enter2) & WF(Req2) => GF([Enter2])";
/*ASSERT_LTL_3 == "(SF(Enter1) & SF(Enter2)) & (WF(Req1) & WF(Req2)) => GF [Enter1] & GF [Enter2]";
ASSERT_LTL_4 == "not GF {p1 = noncrit1 & p2 = crit2 & y = 0}";
ASSERT_LTL_5 == "WF(Req1) => not GF {p1 = noncrit1 & p2 = crit2 & y = 0}";
ASSERT_LTL_6 == "SF(Req1) => not GF {p1 = noncrit1 & p2 = crit2 & y = 0}"; */

SETS
 PHASE1={noncrit1,wait1,crit1};
 PHASE2={noncrit2,wait2,crit2}
VARIABLES p1,p2, y
INVARIANT
 p1:PHASE1 & p2:PHASE2 & y:0..1
INITIALISATION
 p1 := noncrit1 || p2 := noncrit2 || y:=1
OPERATIONS
  Req1 = PRE p1 = noncrit1 THEN p1 := wait1 END;
  Req2 = PRE p2 = noncrit2 THEN p2 := wait2 END;
  Enter1 = PRE p1 = wait1 & y>0 THEN p1 := crit1 || y := y-1 END;
  Enter2 = PRE p2 = wait2 & y>0 THEN p2 := crit2 || y := y-1 END;
  Rel1 = PRE p1 = crit1 THEN p1 := noncrit1 || y := y+1 END;
  Rel2 = PRE p2 = crit2 THEN p2 := noncrit2 || y := y+1 END
END