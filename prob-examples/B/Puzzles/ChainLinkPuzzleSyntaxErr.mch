MACHINE ChainLinkPuzzle
SETS
 LINKS
CONSTRAINTS
 card(LINKS) = 16
CONSTANTS chains
PROPERTIES
  chains:1..4 -> LINKS &
  !i.(i:1..4 => card(chains(i))=3) &
  UNION(i).(i:1..4|ran(chains(i)) = LINKS &
  !(i.j).(i:1..3 & j:2..4 & i<j => (chains(i)/\chains(j)={}))
DEFINITIONS
  scope_LINKS == 1..16;
  GOAL == (dom(linked)=LINKS)
VARIABLES open,linked
INVARIANT
 open <: LINKS &
 linked: LINKS <-> LINKS
INITIALISATION open := {} || linked := {}
OPERATIONS
  CutChain(cc) = PRE cc:LINKS & cc/:open THEN open := open \/ {cc} END;
  AddLink(from,to) = PRE from:open & to:LINKS & (from|->to)/:linked THEN
    linked := linked \/ {from |-> to} \/ {to |-> from} END
END

