MACHINE RelAndNotRel
SETS
 SNODES
CONSTANTS NODES,edges,c
PROPERTIES card(SNODES) =4 &
  NODES <: SNODES &
  edges : NODES <-> NODES &
  card(NODES) > 3 &
  c: NATURAL &
  (edges : NODES<->NODES => c=1)
END