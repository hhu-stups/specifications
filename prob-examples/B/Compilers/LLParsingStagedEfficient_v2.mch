MACHINE LLParsingStagedEfficient_v2 /* dangling else grammar */
SETS
  Symbols = {S,E,S2, i,t,e,a,b} /* {S,T,R,V,a,b,x,y,z} {S,N,a,b,c} */
CONSTANTS
  Rules, Terminals, NonTerminals
PROPERTIES
  Rules: Symbols <-> seq(Symbols) &
  NonTerminals = dom(Rules) &
  Terminals = Symbols - NonTerminals &
 
  Rules = { S |-> [i,E,t,S,S2], S|-> [a],
            S2 |-> [e,S], S2 |-> [],
            E |-> [b] }
 /* Rules = { S |-> [a,S],  S |-> [N,c], S |-> [N], N |-> [b], N |-> [] } */
 /* Rules = { S |-> [a,S,a], S |-> [b,T,b], 
            T |-> [V,R,T], T |-> [R],
            R |-> [x,R], R |-> [y,R], R |-> [],
            V |-> [z,R] } */
DEFINITIONS
  inFirst(t,s,j) == (j<=size(s) & t:First(s(j)) &
                                !k.(k:NATURAL1 & k<j => s(k):Nullable));
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
  AddNullable(N) = PRE Stage=1 & N:NonTerminals & N/:Nullable &
                       #s.(s:seq(Symbols) & N|->s:Rules &
                           ran(s) <: Nullable) THEN
        Nullable := Nullable \/ {N}
  END;
  FinishedNullable = PRE Stage=1 THEN Stage := 2 END;
  AddFirst(N,t,s,j) = PRE Stage=2 & N:NonTerminals & t:Terminals & t/:First(N) &
                          s:seq(Symbols) & s/=[] & N|->s:Rules &
                          inFirst(t,s,j)  THEN
        First(N) := First(N) \/ {t}
  END;
  FinishedFirst = PRE Stage=2 THEN Stage := 3 END;
  AddFollow(N,t,s,i,j) =  PRE Stage=3 & N:NonTerminals & t:Terminals & t/:Follow(N) &
                        s:seq(Symbols) & s/=[] & s:ran(Rules) &
                                i:NATURAL1 & i<size(s) & s(i) = N  &
                                j>i & j <= size(s) & t:First(s(j)) &
                                !k.(k:NATURAL1 & k>i & k<j => s(k):Nullable) THEN
        Follow(N) := Follow(N) \/ {t}
  END;
  AddFollow2(N,X,s,i) = PRE Stage=3 & N:NonTerminals & X:NonTerminals & X/=N &
                          Follow(X) /<: Follow(N) & 
                          s:seq(Symbols) & s/=[] & X|->s:Rules &
                          i>0 & i<=size(s) & N = s(i) &
                          !k.(k:NATURAL1 & k>i & k<=size(s) => s(k):Nullable) THEN
        Follow(N) := Follow(N) \/ Follow(X)
  END
END