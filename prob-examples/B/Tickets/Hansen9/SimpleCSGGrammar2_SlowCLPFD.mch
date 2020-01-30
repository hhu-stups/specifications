MACHINE SimpleCSGGrammar2_SlowCLPFD
/* ApllyRule used to get slower and slower because of enumeration of sequences
   and concat_sequence not instantiating result sufficiently
   {1|->a}^xx = {1|->yy} \/ ...  would not instantiate yy to a 
  This is now fixed in concat_sequence_aux by adding unify_same_index_elements;
  in future we should probably write
  a dedicated disjoint_union operator for sequences
*/
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
ANIMATION_FUNCTION == {r,c,i| r=1 & c:dom(cur) & i=cur(c)};
 SET_PREF_CLPFD == TRUE
/* ;  "LibraryIO.def"
;	observe(x) == TRUE=TRUE
; 	EXTERNAL_PREDICATE_observe(T) == T */
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
	& cur = (cur /|\ x) ^(LHS^ (cur \|/ y))
        /* & observe((x,y,LHS,RHS)) */
	THEN
    cur := (cur /|\ x)^RHS^(cur \|/ y)
 END
END