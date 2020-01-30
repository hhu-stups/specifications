MACHINE           Customer

SEES              Price, Goods

CONSTANTS         limit

PROPERTIES        limit : GOODS --> NAT1

VARIABLES         purchases

INVARIANT         purchases <: GOODS

INITIALISATION    purchases := {}

OPERATIONS

pp <-- buy(gg) =
  PRE gg : GOODS & price(gg) <= limit(gg)
  THEN purchases := purchases \/ {gg} || pp <-- pricequery(gg)
  END

END
