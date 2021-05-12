MACHINE GrammarChomskyNormalForm
/* An encoding of grammar rewriting steps as B operations */
SETS
 Alphabet = {a,b,   S,A,B,C}
CONSTANTS Terminals, NonTerminals, Productions
PROPERTIES
 Terminals = {a,b} &
 Terminals /\ NonTerminals = {} &
 Terminals \/ NonTerminals = Alphabet &
 /* the following is the CFG from Example 6.7 illustrating CYK in Hopcroft/Ullman */
 Productions = {
                  [S] |-> [A,B], [S] |-> [B,C],
                  [A] |-> [B,A], [A] |-> [a],
                  [B] |-> [C,C], [B] |-> [b],
                  [C] |-> [A,B], [C] |-> [a]
               }
DEFINITIONS GOAL == (cur = [b,a,a,b,a]);
 ANIMATION_FUNCTION == {r,c,i| r=1 & c:dom(cur) & i=cur(c)};
 ANIMATION_STR1 == "a"; ANIMATION_STR2 == "b"; ANIMATION_STR3 == "S"; ANIMATION_STR4 == "A";
 ANIMATION_STR5 == "B"; ANIMATION_STR6 == "C"
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

