MACHINE LL_LeftFactoring /* implementation of algorithm for left-factoring
 and removal of left recursion */
SETS
  Symbols = {E,T,F, E2,T2,F2, idf, plus, mul, lpar, rpar} /* {S,T,R,V,a,b,x,y,z} {S,N,a,b,c} */
CONSTANTS
  Terminals, NonTerminals
PROPERTIES
  NonTerminals = {E,T,F, E2,T2,F2} &
  Terminals = Symbols - NonTerminals 

DEFINITIONS
  inFirst(t,s,j) == (j:dom(s) & t:First(s(j)) & nullable_str(s /|\ (j-1)));
  nullable_str(s) == ran(s) <: Nullable;
  ANIMATION_STR_JUSTIFY_LEFT == TRUE;
  ANIMATION_FUNCTION1 == {r,c,i|r:NonTerminals & c=1 & i=r};
  ANIMATION_FUNCTION2 == {r,c,i|r:NonTerminals & c=2 & i=Rules[{r}]};
VARIABLES
  Rules
INVARIANT
  Rules: Symbols <-> seq(Symbols)
INITIALISATION
  Rules := { E  |-> [E,plus,T], 
             E |->  [T],
             T  |-> [T,mul,F], 
             T |->  [F],
             F  |-> [lpar, E, rpar], F |-> [idf]
          }
OPERATIONS
  RemoveLeftRecursion(X,RHS,X2) = 
   SELECT X |-> RHS: Rules & RHS /= <> & first(RHS) = X & 
          X2 : NonTerminals & X2 /: dom(Rules) THEN
      Rules :=  ({X} <<| Rules) \/
                 dom({H, aX2,a | H=X & X |-> a : Rules & 1|->X /: a & aX2 = a^[X2]}) \/
                 dom({H ,gX2,g | H=X2 & X |-> ([X]^g) : Rules & gX2 = g^[X2]}) \/
                 {X2|->[]}
  END;
  RemoveLeftFactor(X,Prefix,Rest1,Rest2,RHS1,RHS2) =
    SELECT X |-> RHS1 : Rules & X |-> RHS2 : Rules & RHS1 /= RHS2 &
           RHS1 = Prefix^Rest1 & RHS2 = Prefix^Rest2 &
           Prefix /= [] THEN
      skip /* not yet implemented */
    END
END