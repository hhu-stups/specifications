MACHINE CrewAllocationConstantsLarge
/* Currently can only be solved with KODKOD preference set to TRUE */
DEFINITIONS
 NRF == 20;
 FLIGHTS == 1..NRF;
 CONSTR1 == (!f.(f:FLIGHTS => speaks[assign[{f}]] = LANGUAGE));  /* all languages must be represented on all flights */
 CONSTR2 == (!f.(f:FLIGHTS => male[assign[{f}]] = BOOL)); /* both sexes must be on all flights */
 CONSTR3 == (!(f,p).(f:FLIGHTS & f<NRF-1 & p:PERSONNEL &  f|->p:assign & (f+1)|->p:assign
                 => (f+2)|->p /: assign));
 CONSTR4 == (ran(assign) = PERSONNEL);
 SET_PREF_MAXINT == 255;
 SET_PREF_MAX_INITIALISATIONS == 1 /*;
 SET_PREF_KODKOD == TRUE*/
SETS
 PERSONNEL = {tom, david, jeremy, carol, janet, tracy};
 LANGUAGE = {french,german,spanish}
CONSTANTS male, speaks, assign
PROPERTIES
  male : PERSONNEL --> BOOL &
  speaks : PERSONNEL <-> LANGUAGE &
  ran(male) = BOOL &
  ran(speaks) = LANGUAGE &

  male = { tom|->TRUE, david|->TRUE, jeremy|->TRUE, carol|->FALSE, janet|->FALSE, tracy|->FALSE} &
  speaks = { tom|->german, david |-> french, jeremy |-> german, carol |-> spanish, janet |-> french, tracy |-> spanish }
 &
  assign: FLIGHTS <-> PERSONNEL
  & CONSTR1 & CONSTR2 & CONSTR3 & CONSTR4
ASSERTIONS
  CONSTR1; CONSTR2; CONSTR3; CONSTR4
OPERATIONS
  r <-- get_assignment(f) = PRE f:FLIGHTS THEN r := assign[{f}] END;
  r <-- get_languages(f) = PRE f:FLIGHTS THEN r := speaks[assign[{f}]] END;
  r <-- RanAssign = BEGIN r:= ran(assign) END;
  d <-- DomAssign = BEGIN d:= dom(assign) END
END

