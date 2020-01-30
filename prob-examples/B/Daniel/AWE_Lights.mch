MACHINE AWE_Lights
 /* CTL : ef(e(b(stop_Moat/0))) 
    ag(e(b(stop_All/0)))
    ef(not(e(b(stop_All/0))))
*/
DEFINITIONS
  ASSERT_LTL == "G ([Stop_All] -> X (e(Go_Moat) & e(Go_Square)))";
  ASSERT_LTL2 == "G ([Go_Moat] -> X (e(Stop_All) & e(Stop_Moat)))";
  ASSERT_LTL3 == "G([Stop_All] -> X not(e(Go_Moat)))"
SETS
 COMMAND = {Stop, Go}
VARIABLES Moat, Square
INVARIANT (Moat = Stop or Square = Stop) &
          Moat : COMMAND & Square : COMMAND
INITIALISATION Moat,Square := Stop, Stop
OPERATIONS
  Stop_All = BEGIN Moat,Square := Stop,Stop END;
  /* {Go_Moat,Go_Square} NEXT
      LTL: G ([Stop_All] -> X (e(Go_Moat) & e(Go_Square))) -> TRUE (0.00 s) */
  Go_Moat = PRE Moat=Stop & Square = Stop THEN Moat := Go END;
  /* {Stop_All,Stop_Moat} NEXT
      LTL: G ([Go_Moat] -> X (e(Stop_All) & e(Stop_Moat))) -> TRUE (0.00 s) */
  Stop_Moat = PRE Moat=Go THEN Moat := Stop END;
  /* {Go_Moat,Go_Square} NEXT
      LTL: G ([Stop_Moat] -> X (e(Go_Moat) & e(Go_Square))) -> TRUE (0.00 s) */
  Go_Square = PRE Moat=Stop & Square = Stop THEN Square := Go END;
  /* {Stop_All,Stop_Square} NEXT
      LTL: G ([Go_Square] -> X (e(Stop_All) & e(Stop_Square))) -> TRUE (0.00 s) */
  Stop_Square = PRE Square=Go THEN Square := Stop END
  /* {Go_Moat,Go_Square} NEXT
      LTL: G ([Stop_Square] -> X (e(Go_Moat) & e(Go_Square))) -> TRUE (0.00 s) */
END

