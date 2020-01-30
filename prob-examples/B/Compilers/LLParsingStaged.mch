MACHINE LLParsingStaged
/* Note: especially the AddFollow Operation is very inefficient due to
   nested existential quantifiers ?! */
SETS
  Symbols = {S,T,R,V,a,b,x,y,z} /* {S,N,a,b,c} */
CONSTANTS
  Rules, Terminals, NonTerminals
PROPERTIES
  Rules: Symbols <-> seq(Symbols) &
  NonTerminals = dom(Rules) &
  Terminals = Symbols - NonTerminals &
 
 /* Rules = { S |-> [a,S],  S |-> [N,c], S |-> [N], N |-> [b], N |-> [] } */
  Rules = { S |-> [a,S,a], S |-> [b,T,b], 
            T |-> [V,R,T], T |-> [R],
            R |-> [x,R], R |-> [y,R], R |-> [],
            V |-> [z,R] }
DEFINITIONS
  inFirst(t,s) == (#i.(i:NATURAL1 & i<=size(s) &
                       ran(s /|\ i-1) <: Nullable &
                       t:First(s(i))))
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
  AddFirst(N,t) = PRE Stage=2 & N:NonTerminals & t:Terminals & t/:First(N) &
                        #s.(s:seq(Symbols) & s/=[] & N|->s:Rules &
                            inFirst(t,s))  THEN
        First(N) := First(N) \/ {t}
  END;
  FinishedFirst = PRE Stage=2 THEN Stage := 3 END;
  AddFollow(N,t) =  PRE Stage=3 & N:NonTerminals & t:Terminals & t/:Follow(N) &
                        #(s,st,i).(s:seq(Symbols) & s/=[] & s:ran(Rules) &
                                i:NATURAL1 & i<size(s) & 
                                st:seq(Symbols)  & st = s \|/i &
                                s(i) = N & inFirst(t, st)) THEN
        Follow(N) := Follow(N) \/ {t}
  END 
  /* Still one inference rule missing: if Non-Terminal at end of rule*/
END