MACHINE Loop
SETS
 Blocks={b1,b2,b3,b4,b5,b6,entry,exit}
CONSTANTS succs, lentry, L
PROPERTIES
 succs: Blocks <-> Blocks &
 succs = {entry |-> b1, b1|-> b2, b2|-> b3, b3 |-> b3, b3|-> b4,
         b4 |-> b2, b4 |-> b5, b5 |-> b6, b6 |-> b6, b6 |-> exit}  /* Figure 8.9, page 530 of DragonBook */
 & L <: Blocks
 & lentry : L
 & succs~[L-{lentry}] <: L
 & !l.(l:Blocks /\ L => lentry : closure1(L <| succs |> L)[{l}])
ASSERTIONS
  (lentry=b2 & (L={b1,b2,b3,b4,entry} or L={b2,b3,b4})) or 
  (lentry=b3 & (L={b3} or L={b1,b2,b3,b4,entry})) or 
  (lentry=b4 & L={b1,b2,b3,b4,entry}) or
  (lentry=b6 & (L={b6} or L={b1,b2,b3,b4,b5,b6,entry}))
END

