MACHINE SyracuseGrammar
/* An encoding of the Syracuse Function as a general type-0 grammar */
SETS
 Alphabet = {s,   Begin,End,S, M3, D2, Even, Odd}
CONSTANTS Terminals, NonTerminals, Productions, NumberSeq
PROPERTIES
 Terminals = {s} &
 Terminals /\ NonTerminals = {} &
 Terminals \/ NonTerminals = Alphabet &
 Productions : seq(Alphabet) <-> seq(Alphabet) &
 Productions = {
                  [S] |-> ([Begin,Even] ^ NumberSeq ^ [End]),
                  [Even,s] |-> [s,Odd], /* traverse number from left-to-right, determine if even or odd */
                  [Odd,s] |-> [s,Even],
                  [Even,End] |-> [D2,End], /* start dividing by two */
                  [Odd,End] |-> [M3,s,End], /* start multiplying by three */
                  [s,M3] |-> [M3,s,s,s],  /* multiply by 3 */
                  [s,s,D2] |-> [D2,s],    /* divide by 2 */
                  [Begin,M3,s,s] |-> [Begin,s,s,Even], /* finished multiply pass */
                  [Begin,D2,s,s] |-> [Begin,s,s,Even], /* finished division pass */
                  [Begin,D2,s,End] |-> [s]  /* we are finished; we have reached 1 */
               } &
 NumberSeq = %i.(i:1..4|s)
DEFINITIONS
 ANIMATION_FUNCTION == {r,c,i| r=1 & c:dom(cur) & i=cur(c)};
 ANIMATION_STR1 == "s"; ANIMATION_STR2 == "Begin"; ANIMATION_STR3 == "End";
 ANIMATION_STR4 == "S"; ANIMATION_STR5 == "M3"; ANIMATION_STR6 == "D2";
 ANIMATION_STR7 == "Even"; ANIMATION_STR8 == "Odd"    
VARIABLES cur
INVARIANT
 cur : seq(Alphabet)
INITIALISATION cur:=[S]
OPERATIONS
  ApplyRule(LHS,RHS,pre,post) = PRE LHS|->RHS : Productions &
                           pre: seq(Alphabet) & post:seq(Alphabet) &  
                           cur = pre^LHS^post THEN
     cur := pre^RHS^post 
  END
END

