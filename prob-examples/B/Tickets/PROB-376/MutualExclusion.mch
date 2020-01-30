MACHINE MutualExclusion
DEFINITIONS
ASSERT_LTL1 == "G {not(p1 = crit1 & p2 = crit2)}"; /* safety property */
ASSERT_LTL2 == "G ({p1 = wait1} => F {p1 = crit1})" /* liveness property */
SETS
 PHASE1={noncrit1,wait1,crit1};
 PHASE2={noncrit2,wait2,crit2}
VARIABLES p1,p2, y
INVARIANT
 p1:PHASE1 & p2:PHASE2 & y:0..1 & not(p1 = crit1 & p2 = crit2)
INITIALISATION
 p1 := noncrit1 || p2 := noncrit2 || y:=1
OPERATIONS
  Req1 = PRE p1 = noncrit1 THEN p1 := wait1 END;
  Req2 = PRE p2 = noncrit2 THEN p2 := wait2 END;
  Enter1 = PRE p1 = wait1 & y=1 THEN p1 := crit1 || y := 0 END;
  Enter2 = PRE p2 = wait2 & y=1 THEN p2 := crit2 || y := 0 END;
  Rel1 = PRE p1 = crit1 THEN p1 := noncrit1 || y := 1 END;
  Rel2 = PRE p2 = crit2 THEN p2 := noncrit2 || y := 1 END
END