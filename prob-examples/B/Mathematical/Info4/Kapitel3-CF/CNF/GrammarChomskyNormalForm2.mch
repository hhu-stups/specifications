MACHINE GrammarChomskyNormalForm
/* An encoding of grammar rewriting steps as B operations */
SETS
 Alphabet = {a,b,   S,A,B,C,D,E}
CONSTANTS Terminals, NonTerminals, Productions
PROPERTIES
 Terminals = {a,b} &
 Terminals /\ NonTerminals = {} &
 Terminals \/ NonTerminals = Alphabet &
 /* the following is the CFG from the INFO4 Script (slide 83ff) */
 Productions = {
                  [S] |-> [A,B], [S] |-> [A,C], [S] |-> [D,E],
                  [A] |-> [a],
                  [B] |-> [b],
                  [C] |-> [S,B], 
                  [D] |-> [A,S],
                  [E] |-> [B,B]
               }
DEFINITIONS 
 target == [a,a,b,b,b];
 GOAL == (cur = target);
 ANIMATION_FUNCTION == {r,c,i| r=1 & c:dom(cur) & i=cur(c)};
 ANIMATION_STR1 == "a"; ANIMATION_STR2 == "b"; ANIMATION_STR3 == "S"; ANIMATION_STR4 == "A";
 ANIMATION_STR5 == "B"; ANIMATION_STR6 == "C"; ANIMATION_STR7 == "D"; ANIMATION_STR8 == "E"
VARIABLES cur
INVARIANT
 cur : seq(Alphabet)
INITIALISATION cur:=[S]
OPERATIONS
  ApplyRule(LHS,RHS,pre,post) = PRE LHS|->RHS : Productions &
 /*                          pre: seq(Alphabet) & post:seq(Alphabet) &  */
                           cur = pre^LHS^post &
                           size(cur) <= size(target)
  THEN
     cur := pre^RHS^post 
  END
END

