MACHINE ArithTermGrammar
/* A simple encoding of grammar rewriting steps as B operations */
SETS
 Alphabet = {a,plus,mal,auf,zu,   S}
CONSTANTS Terminals, NonTerminals, Productions
PROPERTIES
 Terminals = {a,plus,mal,auf,zu} &
 Terminals /\ NonTerminals = {} &
 Terminals \/ NonTerminals = Alphabet &
 Productions = {
                  S |-> [S,plus,S],
                  S |-> [S,mal,S],
                  S |-> [auf,S,zu], 
                  S |-> [a]
               }
DEFINITIONS
 ANIMATION_FUNCTION == {r,c,i| r=1 & c:dom(cur) & i=cur(c)};
 ANIMATION_STR1 == "a"; ANIMATION_STR2 == "+"; ANIMATION_STR3 == "*"; 
 ANIMATION_STR4 == "["; ANIMATION_STR5 == "]"; ANIMATION_STR6 == "S"
VARIABLES cur
INVARIANT
 cur : seq(Alphabet)
INITIALISATION cur:=[S]
OPERATIONS
  ApplyRule(i,LHS,RHS) = PRE LHS|->RHS : Productions & i:dom(cur) & cur(i)=LHS THEN
     cur := (cur/|\(i-1))^RHS^(cur\|/i) 
  END
END

