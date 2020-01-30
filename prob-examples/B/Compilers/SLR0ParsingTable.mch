MACHINE SLR0ParsingTable
SETS
  Symbols = {SP,S,L,R,eq,idd,st}
CONSTANTS
  Rules, Terminals, NonTerminals
PROPERTIES
  Rules: Symbols <-> seq(Symbols) &
  NonTerminals = dom(Rules) &
  Terminals = Symbols - NonTerminals &
 
 /* Rules = { S |-> [a,S],  S |-> [N,c], S |-> [N], N |-> [b], N |-> [] } */
  Rules = { SP |-> [S],
            S |-> [L,eq,R], S |-> [R], 
            L |-> [st,R], L |-> [idd],
            R |-> [L] }
VARIABLES
  items, added
INVARIANT
  items : NonTerminals <-> (seq(Symbols)*seq(Symbols)) &
  added : POW(NonTerminals)
INITIALISATION
  items := {SP |-> ([]|->[S]) } || added := {}
OPERATIONS
  AddClosureItems(N,R,S1,S2) = PRE N:NonTerminals & N /: added &
                          R:NonTerminals & R/= N & S1:seq(Symbols) & S2:seq(Symbols) &
                          R |->(S1|->S2) : items & S2 /= [] &
                          N = first(S2) THEN
        items := items \/ {N}*( {[]} * Rules[{N}]) || added := added \/ {N}
  END;
  Goto(Sym,R,S1,S2) = PRE Sym:Symbols & R |->(S1|->S2) : items &
                          R:NonTerminals & S1:seq(Symbols) & S2:seq(Symbols) & S2 /= [] &
                          Sym = first(S2) THEN
     /* missing: add this for all items where Sym is first(S2) ! */
      items := { R |-> (S1<-Sym |-> tail(S2)) } || added := {}
  END
END