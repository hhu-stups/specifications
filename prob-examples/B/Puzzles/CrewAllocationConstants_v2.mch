MACHINE CrewAllocationConstants_v2
/* rewritten universal quantification inside CONSTR3 yields big performance boost for NRF=3 */
/* Still too inefficient for  NRF>3; TO DO: investigate source; CONSTR1 seems to be one cause */
/* Probably there is some inefficiency in relational image */
/* IDEA: use total functions assign: FLIGHTS --> POW(PERSONNEL) or even assign: F*P --> BOOL */
/* Solution found in 0.07 seconds (1.8 GHz i7) */
DEFINITIONS
 NRF == 3;
 FLIGHTS == 1..NRF;
 CONSTR1 == (!f.(f:FLIGHTS => speaks[assign[{f}]] = LANGUAGE));  /* all languages must be represented on all flights */
 CONSTR2 == (!f.(f:FLIGHTS => male[assign[{f}]] = BOOL)); /* both sexes must be on all flights */
 CONSTR3 == (!(f).(f:FLIGHTS & f<NRF-1 =>
              !(p).(p:PERSONNEL =>  
                (f|->p:assign & (f+1)|->p:assign)
                    => (f+2)|->p /: assign)));
 CONSTR4 == (ran(assign) = PERSONNEL);
 SET_PREF_MAXINT == 3;
 SET_PREF_MAX_INITIALISATIONS == 1
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
OPERATIONS
  r <-- get_assignment(f) = PRE f:FLIGHTS THEN r := assign[{f}] END;
  r <-- get_languages(f) = PRE f:FLIGHTS THEN r := speaks[assign[{f}]] END
END

