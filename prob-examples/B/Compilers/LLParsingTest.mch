MACHINE LLParsingTest
SETS
  Symbols = {S,T,a,b} /* {S,N,a,b,c} */
CONSTANTS
  Rules, Terminals, NonTerminals
PROPERTIES
  Rules: Symbols <-> seq(Symbols) &
  NonTerminals = dom(Rules) &
  Terminals = Symbols - NonTerminals &
 
  Rules = { S |-> [a,S,a], S |-> [b,T,b] }
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
                        #s.(s:seq(Symbols) & s/=[] & s:ran(Rules)) THEN
        Follow(N) := Follow(N) \/ {t}
    END; 
     Finda(N) = PRE N:Symbols & not(#t.(t:Symbols & t=a & t=N)) THEN
        skip
    END
END