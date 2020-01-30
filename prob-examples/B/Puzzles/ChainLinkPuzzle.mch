MACHINE ChainLinkPuzzle
SETS
 LINKS
/* CONSTRAINTS
 card(LINKS) = 12 */
CONSTANTS chains
PROPERTIES
  card(LINKS) = 12 &
  chains:1..4 --> POW(LINKS) &
  !ic.(ic:1..4 => card(chains(ic))=3) &
  UNION(iu).(iu:1..4|chains(iu)) = LINKS &
  !(i3,j).(i3:1..3 & j:2..4 & i3<j => (chains(i3)/\chains(j)={}))
DEFINITIONS
  scope_LINKS == 1..12;
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

