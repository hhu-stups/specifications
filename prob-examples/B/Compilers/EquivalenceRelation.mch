MACHINE EquivalenceRelation
/* Modelling the R_L equivalence relation,
   the induced equivalence classes and the language index
   related to the Myhill and Nerode theorem for regular languages */
SETS
 Alphabet = {a,b,c}
ABSTRACT_CONSTANTS All, Classes, RL
CONSTANTS L, maxsz, index
DEFINITIONS
  class(x) == {y| x|->y : RL} ; SET_PREF_MAXINT == 3
PROPERTIES
 L <: seq(Alphabet) &
 /* All = {z|z:seq(Alphabet) & size(z)<=maxsz} & */ /* limit to finite sequences */
 All = {z|z:seq(Alphabet) & size(z): 0..maxsz} &  /* the above currently raises enum warning */

 RL = ({x,y| x:All & y:All & !z.(z:All => ( x^z : L  <=>  y^z : L))}) &

 L = {[a],[b],[a,a],[b,b],[a,a,c],[b,b,c],[c,c,c]} & maxsz = 3 &

 Classes = ran( %x.(x:All|class(x))) & /* set of equivalence classes {x|x:All•class(x)} */
 index = card( Classes )
ASSERTIONS
 /* check that we have an equivalence relation : */
 !x.(x:All => x|->x : RL); /* reflexive */
 !(x,y).(x|->y : RL => y|->x : RL); /* symmetric */
 !(x,y,z).(x|->y : RL & y|->z : RL => x|->z : RL); /* transitive */

 /* some examples : */
 [a,a] |-> [b,b] : RL;
 [a,a] |-> [c,c] /: RL;
 [b,b,c] |-> [c,c,c] : RL;
 class([a,a]) = {[a,a],[b,b]};
 class([c,c,c]) = {[a,a,c],[b,b,c],[c,c,c]}

/* the DFA induced by the equivalence classes */
VARIABLES z
INVARIANT z <: All
INITIALISATION z := class([])
OPERATIONS
  Delta(a) = PRE a:Alphabet THEN
    ANY x WHERE x:z & !x2.(x2:z => size(x2)>=size(x)) THEN
      z := class(x^[a])
    END
  END;
  Final = SELECT z /\ L /= {} THEN skip END
END

