MACHINE LLParsing
/* Note: especially the AddFollow Operation is very inefficient due to
   nested existential quantifiers ?! */
SETS
  Symbols = {S,T,a,b} /* {S,N,a,b,c} */
CONSTANTS
  Rules, Terminals, NonTerminals
PROPERTIES
  Rules: Symbols <-> seq(Symbols) &
  NonTerminals = dom(Rules) &
  Terminals = Symbols - NonTerminals &
  Rules = { S |-> [a,S,a], S |-> [b,T,b] }
DEFINITIONS "LibraryIO.def";
  inFirst(t,s) == (#ii.(ii:NATURAL1 & ii<=size(s) &
                       ran(s /|\ ii-1) <: {} & 
                       t:{(S|->{}),(T|->{T}),(a|->{a}),(b|->{b})}(s(ii))));
  SET_PREF_MAXINT == 3
VARIABLES
  First
INVARIANT
  First: Symbols --> POW(Terminals)
INITIALISATION
  First := %t.(t:Terminals|{t}) \/ %n.(n:NonTerminals|{}) 
OPERATIONS
/*
{N,s,i,st,t|N:NonTerminals & t:Terminals & s:seq(Symbols) & s/=[] & s:ran(Rules) & i:NATURAL1 & i<size(s) & st=s \|/i & s(i)=N & inFirst(t,st)}  */
  AddFollowTest(N,t,s,st,i) =  PRE N:NonTerminals & t:Terminals & 
                                s:seq(Symbols) & s/=[] & s:ran(Rules) &
                                i:NATURAL1 & i<size(s) & 
 /* i:1..size(s) & */ 
                                st:seq(Symbols)  & st = s \|/i &
                                s(i) = N & 
                                printf("s=~w~n",s) &
                                printf("st=~w~n",st) &
                                printf("i=~w~n",i) &
                                inFirst(t, st)

                            THEN
        skip
  END
END