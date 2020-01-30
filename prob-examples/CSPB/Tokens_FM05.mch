MACHINE Tokens_FM05
SETS OFFICE={o1,o2}; CUST={c1,c2,c3}
CONSTANTS mx
PROPERTIES mx: NAT & mx=3
VARIABLES tokens
INVARIANT tokens: CUST +-> 0..mx
INITIALISATION tokens := {}
OPERATIONS

AddCust(cc) =
PRE cc: CUST & cc /: dom(tokens)
THEN tokens := tokens \/ {cc |-> 0}
END;

RemCust(cc) =
PRE cc: CUST
THEN tokens := {cc} <<| tokens
END;

AllocToken(cc) =
PRE cc: CUST & cc: dom(tokens)
THEN SELECT tokens(cc) < mx THEN
tokens(cc) := tokens(cc) + 1 END
END;

toks <-- ReqTokens(cc,pp) =
PRE cc: CUST & pp: OFFICE & cc: dom(tokens) THEN
IF tokens(cc)=0
THEN toks := 0
ELSE ANY nn WHERE nn: NAT & 1 <= nn & nn <= tokens(cc)
  THEN toks := nn || tokens(cc) := tokens(cc) - nn END
END
END
END