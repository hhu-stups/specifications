MACHINE           Price

SEES              Goods

VARIABLES         price

INVARIANT         price : GOODS --> NAT1

INITIALISATION    price :: GOODS --> NAT1

OPERATIONS

  setprice(gg,pp) =
  PRE gg : GOODS & pp : NAT1
  THEN price(gg) := pp
  END;

pp <-- pricequery(gg) =
  PRE gg : GOODS THEN pp := price(gg) END

END
