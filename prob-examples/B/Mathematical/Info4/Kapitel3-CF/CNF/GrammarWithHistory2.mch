MACHINE SimpleCSGGrammar2
/* A simple encoding of grammar rewriting steps as B operations */
/* This version keeps the history */
/* Here the example grammar is a context-sensitive grammar */
SETS
 Alphabet = {a,b,c,   S,B,C}
CONSTANTS Terminals, NonTerminals, Productions
PROPERTIES
 Terminals = {a,b,c} &
 Terminals /\ NonTerminals = {} &
 Terminals \/ NonTerminals = Alphabet &
 Productions : seq(Alphabet) <-> seq(Alphabet) &
 Productions = {
                  [S]   |-> [a,S,B,C], 
                  [S]   |-> [a,B,C],
                  [C,B] |-> [B,C],
                  [a,B] |-> [a,b],
                  [b,B] |-> [b,b],
                  [b,C] |-> [b,c],
                  [c,C] |-> [c,c]
               }
DEFINITIONS GOAL == (last(derivation) = [a,a,b,b,c,c]);
 ANIMATION_FUNCTION == {r,c,i| r:dom(derivation) & c:dom(derivation(r)) & i=derivation(r)(c)}
VARIABLES derivation
INVARIANT
 derivation : seq(seq(Alphabet))
INITIALISATION derivation:=[[S]]
OPERATIONS
  ApplyRule(LHS,RHS,pre,post) = PRE LHS|->RHS : Productions &
                           last(derivation) = pre^LHS^post THEN
     derivation := derivation ^ [pre^RHS^post] 
  END
END
