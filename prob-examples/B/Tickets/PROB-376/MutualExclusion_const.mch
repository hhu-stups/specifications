MACHINE MutualExclusion
DEFINITIONS
ASSERT_LTL1 == "G {not(p1 = crit & p2 = crit)}"; /* safety property */
ASSERT_LTL2 == "G ({p1 = wait} => F {p1 = crit})" /* liveness property */
SETS
 PHASE={noncrit,wait,crit}
VARIABLES p1,p2, y
INVARIANT
 p1:PHASE & p2:PHASE & y:0..1 & not(p1 = crit & p2 = crit)
INITIALISATION
 p1 := noncrit || p2 := noncrit || y:=1
OPERATIONS
  Req1 = PRE p1 = noncrit THEN p1 := wait END;
  Req2 = PRE p2 = noncrit THEN p2 := wait END;
  Enter1 = PRE p1 = wait & y=1 THEN p1 := crit || y := 0 END;
  Enter2 = PRE p2 = wait & y=1 THEN p2 := crit || y := 0 END;
  Rel1 = PRE p1 = crit THEN p1 := noncrit || y := 1 END;
  Rel2 = PRE p2 = crit THEN p2 := noncrit || y := 1 END
END
