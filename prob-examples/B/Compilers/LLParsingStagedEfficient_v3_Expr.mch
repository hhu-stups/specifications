MACHINE LLParsingStagedEfficient_v3 /* dangling else grammar */
 /* slightly more elegant formalisation than v2 */
SETS
  Symbols = {E,T,E2,T2,F, idf, plus, mul, lpar, rpar} /* {S,T,R,V,a,b,x,y,z} {S,N,a,b,c} */
CONSTANTS
  Rules, Terminals, NonTerminals
PROPERTIES
  Rules: Symbols <-> seq(Symbols) &
  NonTerminals = dom(Rules) &
  Terminals = Symbols - NonTerminals &
 
  Rules = { E  |-> [T,E2],
            E2 |-> [plus,T,E2], E2 |-> [],
            T  |-> [F,T2],
            T2 |-> [mul,F,T2], T2|-> [],
            F  |-> [lpar, E, rpar], F |-> [idf]
          }

DEFINITIONS
  inFirst(t,s,j) == (j:dom(s) & t:First(s(j)) & nullable_str(s /|\ (j-1)));
  nullable_str(s) == ran(s) <: Nullable;
  ANIMATION_STR_JUSTIFY_LEFT == TRUE;
  ANIMATION_FUNCTION_DEFAULT == {(0,1,"NonTerminal"),(0,2,"Nullable"),(0,3,"First"),(0,4,"Follow")};
  ANIMATION_FUNCTION1 == {r,c,i|r:NonTerminals & c=1 & i=r};
  ANIMATION_FUNCTION2 == {r,c,i|r:NonTerminals & c=2 & i=bool(r:Nullable)};
  ANIMATION_FUNCTION3 == {r,c,i|r:NonTerminals & c=3 & i=First(r)};
  ANIMATION_FUNCTION4 == {r,c,i|r:NonTerminals & c=4 & i=Follow(r)}
VARIABLES
  Nullable, First, Follow,Stage
INVARIANT
  Nullable <: NonTerminals &
  First: Symbols --> POW(Terminals)&
  Follow: NonTerminals --> POW(Terminals) &
  Stage: 1..3
INITIALISATION
  Nullable := {} ||
  First := %t.(t:Terminals|{t}) \/ %n.(n:NonTerminals|{}) ||
  Follow := %n.(n:NonTerminals|{}) ||
  Stage := 1
OPERATIONS
  AddNullable(N,s) = PRE Stage=1 & N:NonTerminals & N/:Nullable &
                          N|->s:Rules & nullable_str(s) THEN
        Nullable := Nullable \/ {N}
  END;
  FinishedNullable = PRE Stage=1 THEN Stage := 2 END;

  AddFirst(N,t,s,j) = PRE Stage=2 & N:NonTerminals & t:Terminals & t/:First(N) &
                          N|->s:Rules & inFirst(t,s,j)  THEN
        First(N) := First(N) \/ {t}
  END;
  FinishedFirst = PRE Stage=2 THEN Stage := 3 END;

  AddFollow(N,t,s,i,j) =  PRE Stage=3 & N:NonTerminals & t:Terminals & t/:Follow(N) &
                                s:ran(Rules) & /* pick any RHS of a rule */
                                // Find a rule _ |-> ... N rest where t:First(rest)
                                i>0 & i<size(s) & s(i) = N  &
                                inFirst(t, s \|/ i, j) THEN
        Follow(N) := Follow(N) \/ {t}
  END;
  AddFollow2(N,X,s,i) = PRE Stage=3 & N:NonTerminals & X:NonTerminals & X/=N &
                          Follow(X) /<: Follow(N) & 
                         // Find a rule X |-> ... N rest  where rest is nullable 
                          X|->s:Rules &
                          i>0 & i<=size(s) & N = s(i) &
                          nullable_str(s \|/ i) THEN
        Follow(N) := Follow(N) \/ Follow(X)
  END
END