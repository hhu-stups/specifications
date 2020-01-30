MACHINE LLParsing
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
  inFirst(t,s) == (#ii.(ii:NATURAL1 & ii<=size(s) &
                       ran(s /|\ ii-1) <: Nullable &
                       t:First(s(ii))));
  SET_PREF_MAXINT == 3
VARIABLES
  Nullable, First, Follow
INVARIANT
  Nullable <: NonTerminals &
  First: Symbols --> POW(Terminals)&
  Follow: NonTerminals --> POW(Terminals)
INITIALISATION
  Nullable := {} ||
  First := %t.(t:Terminals|{t}) \/ %n.(n:NonTerminals|{}) ||
  Follow := %n.(n:NonTerminals|{})
OPERATIONS
  AddNullable(N) = PRE N:NonTerminals & N/:Nullable &
                       #s.(s:seq(Symbols) & N|->s:Rules &
                           ran(s) <: Nullable) THEN
        Nullable := Nullable \/ {N}
  END;
  AddFirst(N,t) = PRE N:NonTerminals & t:Terminals & t/:First(N) &
                      #(s).(s:seq(Symbols) & s/=[] & N|->s:Rules &
                            inFirst(t,s))  THEN
        First(N) := First(N) \/ {t}
  END;

  AddFollow(N,t) =  PRE N:NonTerminals & t:Terminals & t/:Follow(N) &
                        #(s,st,i).( 
                                s:seq(Symbols) & s/=[] & s:ran(Rules) &
                                i:NATURAL1 & i<size(s) & /* i : 1..size(s) & */
                                st:seq(Symbols)  & st = s \|/i &
                                s(i) = N & inFirst(t, st) ) 
                            THEN
        Follow(N) := Follow(N) \/ {t}
  END
 /* Still one inference rule missing: if Non-Terminal at end of rule*/
END