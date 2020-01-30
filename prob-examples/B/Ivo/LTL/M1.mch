MACHINE M1
DEFINITIONS
  /* "F deadlock(Evt1)" is fulfilled since it gets disabled when x=3 */
  ASSERT_LTL1 == "F deadlock(Evt1)";
  /* "F deadlock(Evt1,Evt2)" fails as there is a path leading to a state
     with Evt2 loop. Counterexample: <Evt1,Evt1,Evt1,Evt2,Evt2> */
  ASSERT_LTL2 == "F deadlock(Evt1,Evt2)";
  ASSERT_LTL3 == "F deterministic(Evt,Evt1)";
  /* has been tested with the LTL preference "Strat search at: current state" */ 
  ASSERT_LTL4 == "deterministic(Evt(2,1),Evt(4,1),Evt1)";
  /* "G controller(Evt1,Evt2)" and "G deterministic(Evt1,Evt2)" are satisfied
     since either Evt1 or Evt2 is enabled. Both are never simultaniously enabled */
  ASSERT_LTL5 == "G controller(Evt1,Evt2)";
  ASSERT_LTL6 == "G deterministic(Evt1,Evt2)";
  ASSERT_LTL7 == "SF(Evt) => F deadlock(Evt1,Evt2)";
VARIABLES x,y
INVARIANT
 x:INTEGER & y:INTEGER
INITIALISATION x,y:=0,0
OPERATIONS

  Evt1 = PRE x < 3 THEN x := x+1 END;

  Evt2 = PRE x=3 THEN y := 3 END;

  Evt(x1,r) = PRE x1:{1,2,3,4} & r = 1 & x1 mod 2 =0 & y < 10 THEN y:= x1+y END
END

