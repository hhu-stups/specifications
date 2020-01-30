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
  Rules = { S |-> [a,S,a], S |-> [b,T,b]}
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


  AddFollow(N,t) =  PRE N:NonTerminals & t:Terminals & t/:Follow(N) &
                        #(s,st,i).( 
                                s:seq(Symbols) & s/=[] & s:ran(Rules) &
                                i:NATURAL1 & i<size(s) &  /* i : 1..size(s) & */
                                st:seq(Symbols)  & st = s \|/i &
                                s(i) = N & inFirst(t, st) ) 
/* {N,s,i,st,t|N:NonTerminals & t:Terminals & t /: Follow(N) & s:seq(Symbols) & s/=[] & s:ran(Rules) & i:NATURAL1 & i<size(s) & st=s \|/i & s(i)=N & inFirst(t,st)} */
                            THEN
        skip
  END
 /* Still one inference rule missing: if Non-Terminal at end of rule*/
END