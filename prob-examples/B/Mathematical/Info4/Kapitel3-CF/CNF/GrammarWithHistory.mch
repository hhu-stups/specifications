MACHINE GrammarWithHistory
/* A simple encoding of grammar rewriting steps as B operations */
/* This version keeps the history */
DEFINITIONS
 Alphabet == {"a", "*", "+", "(", ")",   "S"};
 GOAL == (last(derivation) = ["(","a","+","a",")","*","a","+","a"]);
 ANIMATION_FUNCTION == {r,c,i| r:dom(derivation) & c:dom(derivation(r)) & i=derivation(r)(c)}
CONSTANTS Terminals, NonTerminals, Productions
PROPERTIES
 NonTerminals = {"S"} &
 Terminals /\ NonTerminals = {} &
 Terminals \/ NonTerminals = Alphabet &
 Productions : seq(Alphabet) <-> seq(Alphabet) &
 Productions = {
                  ["S"] |-> ["S","+","S"], 
                  ["S"] |-> ["S","*","S"], 
                  ["S"] |-> ["(","S",")"], 
                  ["S"] |-> ["a"]
               } 
VARIABLES derivation
INVARIANT
 derivation : seq(seq(Alphabet))
INITIALISATION derivation:=[["S"]]
OPERATIONS
  ApplyRule(LHS,RHS,pre,post) = PRE LHS|->RHS : Productions &
                           last(derivation) = pre^LHS^post THEN
     derivation := derivation ^ [pre^RHS^post] 
  END
END

