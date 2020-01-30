MACHINE Loop
SETS
 Blocks={b1,b2,b3,b4,b5,b6,entry,exit}
CONSTANTS succs
PROPERTIES
 succs: Blocks <-> Blocks &
 succs = {entry |-> b1, b1|-> b2, b2|-> b3, b3 |-> b3, b3|-> b4,
         b4 |-> b2, b4 |-> b5, b5 |-> b6, b6 |-> b6, b6 |-> exit}  /* Figure 8.9, page 530 of DragonBook */
VARIABLES cur
INVARIANT
 cur: Blocks
INITIALISATION cur := entry
OPERATIONS
  Advance(to) = PRE cur |-> to : succs THEN
    cur := to
  END;
  c <-- getclos1(L) = PRE L = {b2,b3,b4,entry} THEN c := closure1(L <| succs |> L) END;
  ci <-- getclos1img(l,L) = PRE L = {b2,b3,b4,entry} & l:L THEN ci := closure1(L <| succs |> L)[{l}] END;
  is_loope(lentry,L) = PRE L<: Blocks & lentry:L & lentry = b2 & L = {b2,b3,b4,entry,b1} &
                          succs~[L-{lentry}] <: L /* all predecessors are in L, except for lentry */ &
                         /* !l.(l:Blocks & l:L => lentry : closure1(L <| succs |> L)[{l}]) */
                          !l.(l:Blocks => (l:L => lentry : closure1(L <| succs |> L)[{l}]) )
      THEN
     skip
  END;
  is_loop(lentry,L) = PRE L<: Blocks & lentry:L &  /* lentry = b2 & */ /* L = {b2,b3,b4} & */
                          succs~[L-{lentry}] <: L /* all predecessors of nodes in L, except for lentry, are in L */ 
                           & !l.(l:Blocks /\ L => lentry : closure1(L <| succs |> L)[{l}]) 
                         /* & !l.(l:Blocks => (l:L => lentry : closure1(L <| succs |> L)[{l}]) ) */
      THEN

     skip
  END
END

