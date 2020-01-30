MACHINE PostCorrespondence_Turing_TLC
/* Encoding Halting/Execution of a Turing machine as a MPCP Problem */
/* This version only enables Add operations which potentially lead to success;
   making model checking easier */
/* Michael Leuschel, 2012 */
/* The Turing machine has 3 states: z0,z1,z2; z2 is Final
   z0 accepts a and goes to z1 via b; z1 accepts b and goes to z2 via Blank 
*/
SETS
 Alphabet={a,b,Blank,z0,z1,z2,Hash}
DEFINITIONS
 GOAL == (x=y & x/=<>);
 ANIMATION_FUNCTION == {(1,2,x),(2,2,y)};
 ANIMATION_FUNCTION_DEFAULT == {(1,1,"x"),(2,1,"y")};
 SET_PREF_MAX_OPERATIONS == 20
CONSTANTS K
PROPERTIES
 K =  {[a]|->[a], [b]|->[b], [Hash] |-> [Hash] }  /* Copy rules */
      \/
      {[z0,a] |-> [a,z0], [z0,b] |-> [b,z1],
       [z1,b] |-> [b,z1], [z1,Hash] |-> [z2,Hash] }  /* Transition Rules */
      \/
      {[a,z2] |-> [z2], [b,z2] |-> [z2]} /* Deletion rules for final states */
      \/ 
      { [z2,Hash,Hash] |-> [Hash] }  /* Closing rules for final states */
VARIABLES x,y
INVARIANT
 x : seq(Alphabet) & y:seq(Alphabet)
INITIALISATION x,y := [Hash],[Hash,z0,a,a,a,b,b,b,Hash]  /* Start configuration */
OPERATIONS
  /* Add one couple of the PCP problem; return TRUE if there is hope to extending
     the current solution further */
  /* In the TLC version for each parameter a concrete set of values is spezified */
  /* Moreover the quantification #yy.(x^ix^yy = y^iy) is replaced by  y^iy /|\ size(x^ix) = x^ix */
  Add(ix,iy) = 	PRE ix : dom(K) & iy : ran(K) & ix|->iy : K & size(x^ix) <= size(y^iy)
  		THEN SELECT y^iy /|\ size(x^ix) = x^ix THEN x:= x ^ ix || y := y ^ iy END
  		END;
  r <-- Solution = IF x=y & x/=<> THEN r:= TRUE ELSE r:= FALSE END
END

