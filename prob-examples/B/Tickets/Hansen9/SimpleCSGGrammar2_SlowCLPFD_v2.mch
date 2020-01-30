MACHINE SimpleCSGGrammar2_SlowCLPFD
/* ApllyRule gets slower and slower */
/* A simple encoding of grammar rewriting steps as B operations */
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
DEFINITIONS GOAL == (cur = [a,a,b,b,c,c]);
ANIMATION_FUNCTION == {r,c,i| r=1 & c:dom(cur) & i=cur(c)}
VARIABLES cur
INVARIANT
cur : seq(Alphabet)
INITIALISATION cur:=[S]
OPERATIONS
 ApplyRule(LHS,RHS,x,y) = 
	PRE LHS : dom(Productions)
	& ran(LHS) <: ran(cur)
	& RHS : ran(Productions) 
	& LHS|->RHS : Productions 
	& x: 0..size(cur)
	& y : 0..size(cur)
	& y>x
& x+size(LHS)=y /* with this it is faster in CLPFD mode */
	& cur = (cur /|\ x) ^LHS^ (cur \|/ y)
	THEN
    cur := (cur /|\ x)^RHS^(cur \|/ y)
 END
END