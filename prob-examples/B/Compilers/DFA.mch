MACHINE DFA
SETS
 Symbols={a,b,c};
 States = {s1,s2,s3}
CONSTANTS Init,Trans, Final
PROPERTIES
 Init:States & Trans:States-->(Symbols+->States) & Final<:States &

 Init = s1 & Trans = { s1 |-> {  a|-> s2, b|-> s1}, s2 |-> {c |-> s3}, s3 |-> {a |-> s1} } &
 Final = {s3}
VARIABLES cur
INVARIANT
 cur:States
INITIALISATION cur:=Init
OPERATIONS
  Accept = PRE cur:Final THEN skip END;
  Step(symb) = PRE symb:Symbols & symb:dom(Trans(cur)) THEN
    cur := Trans(cur)(symb)
  END
END

