MACHINE SimpleGrammar
/* A simple encoding of grammar rewriting steps as B operations */
SETS
 Alphabet = {a,b,   S}
CONSTANTS Terminals, NonTerminals, Productions
PROPERTIES
 Terminals = {a,b} &
 Terminals /\ NonTerminals = {} &
 Terminals \/ NonTerminals = Alphabet &
 Productions : seq(Alphabet) <-> seq(Alphabet) &
 Productions = {
                  [S] |-> [a,S,b], 
                  [S] |-> [a,b]
               }
DEFINITIONS GOAL == (cur = [a,a,a,a,a,b,b,b,b,b]);
 ANIMATION_FUNCTION == {r,c,i| r=1 & c:dom(cur) & i=cur(c)}
VARIABLES cur
INVARIANT
 cur : seq(Alphabet)
INITIALISATION cur:=[S]
OPERATIONS
  ApplyRule(LHS,RHS,pre,post) = PRE LHS|->RHS : Productions &
 /*                          pre: seq(Alphabet) & post:seq(Alphabet) &  */
                           cur = pre^LHS^post THEN
     cur := pre^RHS^post 
  END
END

