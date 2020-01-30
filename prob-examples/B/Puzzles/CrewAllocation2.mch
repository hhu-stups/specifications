MACHINE CrewAllocation
DEFINITIONS
 CONSTR1 == (!f.(f:FLIGHTS => speaks[assign[{f}]] = LANGUAGE));  /* all languages must be represented on all flights */
 CONSTR2 == (!f.(f:FLIGHTS => sex[assign[{f}]] = SEX)); /* both sexes must be on all flights */
 CONSTR3 == (!(f,p).(f:FLIGHTS & p:PERSONNEL &  f:dom(nnext) &
             f|->p:assign & (next(f))|->p:assign
                 => (nnext(f))|->p /: assign));
 CONSTR4 == (ran(assign) = PERSONNEL)
SETS
 FLIGHTS;
 SEX = {female,male};
 PERSONNEL = {tom, david, jeremy, carol, janet, tracy};
 LANGUAGE = {french,german,spanish}
CONSTANTS sex, speaks, next, nnext
PROPERTIES
  sex = { tom|->male, david|->male, jeremy|->male, carol|->female, janet|->female, tracy|->female} &
  speaks = { tom|->german, david |-> french, jeremy |-> german, carol |-> spanish, janet |-> french, tracy |-> spanish }
&

  next : FLIGHTS +-> FLIGHTS &
  nnext : FLIGHTS +-> FLIGHTS &
  #f1.(f1:FLIGHTS & closure1(next)[{f1}] = FLIGHTS-{f1}) &
  not(#f.(f:FLIGHTS & (f|->f):closure1(next))) &
  nnext = (next;next) &
  sex : PERSONNEL --> SEX &
  speaks : PERSONNEL <-> LANGUAGE &
  ran(sex) = SEX &
  ran(speaks) = LANGUAGE 

VARIABLES assign
INVARIANT
  assign: FLIGHTS <-> PERSONNEL
INITIALISATION assign: (assign:FLIGHTS <-> PERSONNEL & CONSTR1 & CONSTR2 & CONSTR3 & CONSTR4)
OPERATIONS
  r <-- get_assignment(f) = PRE f:FLIGHTS THEN r := assign[{f}] END;
  r <-- get_languages(f) = PRE f:FLIGHTS THEN r := speaks[assign[{f}]] END
END

