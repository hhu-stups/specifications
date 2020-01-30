MACHINE SimpleGrammar
/* There was a bug in disjoint union which lead to
    wrong solutions below if the typing of pre,post 
    is commented out in the operation ApplyRule */
/* arguably the operation is not well-defined
   without the seq-typing; but it is better
   not to generate false results nonetheless */
SETS
 Alphabet = {a,b,c,   S}
CONSTANTS Terminals, NonTerminals, Productions
PROPERTIES
 Terminals = {a,b,c} &
 Terminals /\ NonTerminals = {} &
 Terminals \/ NonTerminals = Alphabet &
 Productions = {
 /*                 [S] |-> [a,S,b], */
                  [S] |-> [a,b]
               }
VARIABLES cur
INVARIANT
 cur : seq(Alphabet)
INITIALISATION cur:=[S]
OPERATIONS
  ApplyRule(LHS,RHS,pre,post) = PRE LHS|->RHS : Productions &
    /* pre: seq(Alphabet) & post:seq(Alphabet) &  */
                           cur = pre^LHS^post THEN
     cur :=  pre^RHS^post 
  END
END

