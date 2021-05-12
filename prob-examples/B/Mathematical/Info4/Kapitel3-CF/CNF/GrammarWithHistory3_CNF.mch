MACHINE SimpleCSGGrammar
/* A simple encoding of grammar rewriting steps as B operations */
/* This version keeps the history */
/* Here the example grammar is a context-sensitive grammar */
SETS
 Alphabet = {a,b,   S,A,B,C,D,E}
CONSTANTS Terminals, NonTerminals, Productions
PROPERTIES
 Terminals = {a,b} &
 Terminals /\ NonTerminals = {} &
 Terminals \/ NonTerminals = Alphabet &
 Productions : seq(Alphabet) <-> seq(Alphabet) &
 Productions = {
                  [S] |-> [A,B], [S] |-> [A,C], [S] |-> [D,E],
                  [A] |-> [a],
                  [B] |-> [b],
                  [C] |-> [S,B], 
                  [D] |-> [A,S],
                  [E] |-> [B,B]
               }
DEFINITIONS GOAL == (last(derivation) = [a,a,a,b,b,b,b]);
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
