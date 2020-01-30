MACHINE Model_01
SETS
  NODES
/* CONCRETE_CONSTANTS
  closure
PROPERTIES
    closure : NODES <-> NODES --> (NODES <-> NODES)
  & !(r).(__truth => r <: closure(r))
  & !(r).(__truth => closure(r) ; r <: closure(r))
  & !(r,s).(r <: s & s ; r <: s => closure(r) <: s)
  & !(connection).(__truth => #(a,b).(connection = a |-> b)) */
DEFINITIONS
  scope_NODES == 2
ABSTRACT_VARIABLES
  DLinks,
  RLinks,
  dlinks,
  rlinks
INVARIANT
    rlinks : NODES --> (NODES <-> NODES)
  & dlinks : NODES --> (NODES <-> NODES)
  & !(n).(n:NODES => rlinks(n) <: RLinks \/ DLinks)
  & !(n).(n:NODES => dlinks(n) <: RLinks \/ DLinks)
  & !(n).(n:NODES => rlinks(n) /\ dlinks(n) = {})
ASSERTIONS
  !(n,m).(m |-> n : closure1(RLinks) => !(k).(k:NODES => (k |-> m : rlinks(n) <=> k |-> m : rlinks(m)) & (k |-> m : dlinks(n) <=> k |-> m : dlinks(m))));
  (!(x,y).(x:NODES & y:NODES => (x |-> y : RLinks <=> x |-> y : rlinks(y))) & !(x,y).(x:NODES & y:NODES => (x |-> y : DLinks <=> x |-> y : dlinks(y)))) => !(M).(!(f,l).(f : M & (l : M & f /= l) => f |-> l : closure1(RLinks)) => !(n).(n : M => M <| rlinks(n) |> M = M <| RLinks |> M & M <| dlinks(n) |> M = M <| DLinks |> M))
INITIALISATION
       RLinks := {}
    ||
       DLinks := {}
    ||
       rlinks := NODES * {{}}
    ||
       dlinks := NODES * {{}}
OPERATIONS
  AddLink(link) = 
    SELECT 
        link /: RLinks
    THEN
         RLinks := RLinks \/ {link}
      ||
         DLinks := DLinks - {link}
    END;
  
  RemoveLink(link) = 
    SELECT 
        link : RLinks
    THEN
         RLinks := RLinks - {link}
      ||
         DLinks := DLinks \/ {link}
    END;
  
  addlink(link,n) = 
    SELECT 
        link : RLinks \/ DLinks
    THEN
         rlinks := rlinks <+ {n |-> (rlinks(n) \/ {link})}
      ||
         dlinks := dlinks <+ {n |-> dlinks(n) - {link}}
    END;
  
  removelink(link,n) = 
    SELECT 
        link : DLinks \/ RLinks
    THEN
         rlinks := rlinks <+ {n |-> rlinks(n) - {link}}
      ||
         dlinks := dlinks <+ {n |-> (dlinks(n) \/ {link})}
    END;
  
  stabilize = 
    SELECT 
        !(n,m).(m |-> n : closure1(RLinks) => !(k).(k:NODES => (k |-> m : rlinks(n) <=> k |-> m : rlinks(m)) & (k |-> m : dlinks(n) <=> k |-> m : dlinks(m))))
      & !(x,y).(x:NODES & y:NODES => (x |-> y : RLinks <=> x |-> y : rlinks(y)))
      & !(x,y).(x:NODES & y:NODES => (x |-> y : DLinks <=> x |-> y : dlinks(y)))
    THEN
      skip
    END
END