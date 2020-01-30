MACHINE GraphIso
SETS
 Nodes = {a,b}
VARIABLES F,G, checked, iso
INVARIANT
 F: Nodes<->Nodes &  G: Nodes<->Nodes & checked:BOOL & iso:BOOL &
 (checked=TRUE => (iso=TRUE => (card(F) = card(G) &
                                card(dom(F)) = card(dom(G)) &
                                card(ran(F)) = card(ran(G))
                                )))
INITIALISATION F:={a |-> b} || G := { b|->a} || checked := FALSE || iso := FALSE
OPERATIONS
  setf(g) = PRE g:Nodes<->Nodes THEN F := g || checked := FALSE END;
  setg(g) = PRE g:Nodes<->Nodes THEN G := g || checked := FALSE END;
  check_isomorphic = IF #p.(p:Nodes>->Nodes & (p~;F;p) = G) THEN
    iso := TRUE || checked := TRUE
   ELSE
    iso := FALSE || checked := TRUE
  END
END

