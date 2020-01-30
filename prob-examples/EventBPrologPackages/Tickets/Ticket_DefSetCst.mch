MACHINE Ticket_DefSetCst
DEFINITIONS
  X == 1
SETS /* deferred */
  PHASE
CONCRETE_CONSTANTS
  p1,
  p2
PROPERTIES
   /* @axm4 */ PHASE = {p1,p2} & card(PHASE)=2
ASSERTIONS
  /* @thm1 */ p1 /= p2;
  X = 1
END

