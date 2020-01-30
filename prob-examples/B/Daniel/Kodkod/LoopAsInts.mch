MACHINE LoopAsInts
CONSTANTS Blocks,succs, lentry, L
PROPERTIES
 Blocks = 1..8 &
 succs: Blocks <-> Blocks &
 succs = {7 |-> 1, 1|-> 2, 2|-> 3, 3 |-> 3, 3|-> 4,
         4 |-> 2, 4 |-> 5, 5 |-> 6, 6 |-> 6, 6 |-> 8} 
 & L <: Blocks
 & lentry : L
 & succs~[L-{lentry}] <: L
 & !l.(l:Blocks /\ L => lentry : closure1(L <| succs |> L)[{l}])
END

