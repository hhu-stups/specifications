MACHINE TopologyOpExpr
DEFINITIONS
 SET_PREF_ALLOW_OPERATION_CALLS_IN_EXPRESSIONS == TRUE;
 SET_PREF_ALLOW_LOCAL_OPERATION_CALLS == TRUE
SETS
 CDV={a,b,c,d,e,f,g,h};
 TRAIN = {tr1,tr2}
CONSTANTS nxt
PROPERTIES
  nxt = {a|->b, b|->c, b|->d, c|->e, e|->f, d|->f, f|->g, h|->g}
VARIABLES pos, trains
INVARIANT
   trains <: TRAIN &
   pos : trains --> CDV
INITIALISATION
 trains := {tr1} || pos := {tr1 |->b}
LOCAL_OPERATIONS
  res <-- follow(t) = PRE t:TRAIN THEN
      res:= IF t:dom(pos) THEN
                 closure1(nxt)[{pos(t)}]
            ELSE
                {}
            END ; pos := {}
  END
ASSERTIONS
  !t.(t:dom(pos) => pos(t) /: follow(t))
  
OPERATIONS
  Move(t,n) = PRE t:dom(pos) & pos(t)|->n : nxt THEN
   ASSERT n:follow(t) THEN pos(t) := n END
  END
  
END

