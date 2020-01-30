REFINEMENT           Baskets(CUSTOMER, GOODS)
REFINES SIGMA_ANC
VARIABLES         baskets

CONSTANTS         price

PROPERTIES        price : GOODS --> NAT1

INVARIANT         baskets : CUSTOMER +-> POW(GOODS)

INITIALISATION    baskets := {}

OPERATIONS

  enter(cu) =
  PRE cu : CUSTOMER & cu /: dom(baskets)
  THEN baskets(cu) := {}
  END;

  add(cu, gg) =
  PRE cu : dom(baskets) & gg : GOODS & gg /: baskets(cu)
  THEN baskets(cu) := baskets(cu) \/ {gg}
  END;
  
  enter_single(cu) = PRE cu: CUSTOMER & cu/: dom(baskets) & card(dom(baskets))>1 THEN 
             enter(cu) END;
            
 add2(cu,g1,g2) =
  PRE cu : dom(baskets) & g1: GOODS & g2 : GOODS & g1 /: baskets(cu) & g2/: baskets(cu) &
       g1 /= g2
  THEN add(cu,g1) ; add(cu,g2)
  END; 
  
  cc <-- max_el(cu) = PRE cu: dom(baskets) & baskets(cu) /= {} THEN
       cc := max(price[baskets(cu)])
     END;  
  cc <-- min_el(cu) = PRE cu: dom(baskets) & baskets(cu) /= {} THEN
       cc := min(price[baskets(cu)])
     END;
  
  bask(cu,bb) = PRE cu: dom(baskets) & bb: POW(GOODS) & bb <<: baskets(cu) THEN skip END;
  
nn <-- checkout(cu) =
  PRE cu : dom(baskets)
  THEN nn := SIGMA (gg) . (gg : GOODS & gg: baskets(cu) | price(gg))
       || baskets := {cu} <<| baskets
  END;
  
nn <-- checkout_Pi(cu) =
  PRE cu : dom(baskets)
  THEN nn := PI (gg) . (gg : GOODS & gg: baskets(cu) | price(gg))
       || baskets := {cu} <<| baskets
  END

END
