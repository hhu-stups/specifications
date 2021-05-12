MACHINE SimpleGrammar3
/* A simple encoding of grammar rewriting steps as B operations */
DEFINITIONS
 Alphabet == {"a", "*", "+", "(", ")",   "S"};
 GOAL == (cur = ["(","a","+","a",")","*","a","+","a"]);
 ANIMATION_FUNCTION == {r,c,i| r=1 & c:dom(cur) & i=cur(c)}
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
VARIABLES cur
INVARIANT
 cur : seq(Alphabet)
INITIALISATION cur:=["S"]
OPERATIONS
  ApplyRule(LHS,RHS,pre,post) = PRE LHS|->RHS : Productions &
 /*                          pre: seq(Alphabet) & post:seq(Alphabet) &  */
                           cur = pre^LHS^post THEN
     cur := pre^RHS^post 
  END
END

