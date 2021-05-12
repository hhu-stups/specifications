MACHINE EquivalenceRelation
/* Modelling the R_L equivalence relation,
   the induced equivalence classes and the language index
   related to the Myhill and Nerode theorem for regular languages */
SETS
 Alphabet = {a,b,c}
CONSTANTS L, RL, maxsz, All, Proj, Classes, index
DEFINITIONS
  class(x) == {y| x|->y : RL} ; SET_PREF_MAXINT == 4; SET_PREF_TRACE_INFO == TRUE;
  SET_PREF_TIME_OUT == 70000
PROPERTIES
 L <: seq(Alphabet) &
 // All = {z|z:seq(Alphabet) & size(z)<=maxsz} & /* limit to finite sequences */
 All = {ss| #ii.(ii:0..maxsz& ss : (1..ii) --> Alphabet)} &

 // RL = ({x,y| x:All & y:All & !z.(z:All => ( x^z : L  <=>  y^z : L))}) &
 Proj = %x.(x:All | {z | x^z:L}) &
 RL = {x,y| x:All & y:All & Proj(x)=Proj(y)} &

 L = {[a,b],[c,c], [a,b,c], [b,b,b], [b,b,b,c], [c,b,c,c]} & maxsz = 4 &

 Classes = ran( %x.(x:All|class(x))) & /* set of equivalence classes {x|x:All•class(x)} */
 index = card( Classes ) 

ASSERTIONS
 /* check that we have an equivalence relation : */
 !x.(x:All => x|->x : RL); /* reflexive */
 !(x,y).(x|->y : RL => y|->x : RL); /* symmetric */
 !(x,y,z).(x|->y : RL & y|->z : RL => x|->z : RL) /* transitive */


/* the DFA induced by the equivalence classes */
VARIABLES z
INVARIANT z <: All
INITIALISATION z := class([])
OPERATIONS
  Delta(aa) = PRE aa:Alphabet THEN
    ANY x WHERE x:z & !x2.(x2:z => size(x2)>=size(x)) THEN
      z := class(x^[aa])
    END
  END;
  Final = SELECT z /\ L /= {} THEN skip END
END

