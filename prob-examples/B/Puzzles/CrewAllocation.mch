MACHINE CrewAllocation
DEFINITIONS
 NRF == 3;
 FLIGHTS == 0..1; /* with 2 already takes longer */
/* TO DO: examine why ProB does not work so well here; reformulate in a way that constraint solving works */
 SET_PREF_MININT == 0;
 SET_PREF_MAXINT == 2;
 CONSTR1 == (!f.(f:FLIGHTS => speaks[assign[{f}]] = LANGUAGE));  /* all languages must be represented on all flights */
 CONSTR2 == (!f.(f:FLIGHTS => male[assign[{f}]] = BOOL)); /* both sexes must be on all flights */
 CONSTR3 == (!(f,p).(f:FLIGHTS & f<NRF-1 & p:PERSONNEL &  f|->p:assign & (f+1)|->p:assign
                 => (f+2)|->p /: assign));
 CONSTR4 == (ran(assign) = PERSONNEL)
SETS
 PERSONNEL = {tom, david, jeremy, carol, janet, tracy};
 LANGUAGE = {french,german,spanish}
CONSTANTS male, speaks
PROPERTIES
  male : PERSONNEL --> BOOL &
  speaks : PERSONNEL <-> LANGUAGE &
  ran(male) = BOOL &
  ran(speaks) = LANGUAGE &

  male = { tom|->TRUE, david|->TRUE, jeremy|->TRUE, carol|->FALSE, janet|->FALSE, tracy|->FALSE} &
  speaks = { tom|->german, david |-> french, jeremy |-> german, carol |-> spanish, janet |-> french, tracy |-> spanish }

VARIABLES assign
INVARIANT
  assign: FLIGHTS <-> PERSONNEL
INITIALISATION assign: (assign:FLIGHTS <-> PERSONNEL & CONSTR1 & CONSTR2 & CONSTR3 & CONSTR4)
OPERATIONS
  r <-- get_assignment(f) = PRE f:FLIGHTS THEN r := assign[{f}] END;
  r <-- get_languages(f) = PRE f:FLIGHTS THEN r := speaks[assign[{f}]] END
END

