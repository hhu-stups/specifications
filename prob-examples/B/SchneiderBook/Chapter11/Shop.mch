MACHINE           Shop

SEES              Price, Goods

VARIABLES         takings

INVARIANT         takings : NAT

INITIALISATION    takings := 0

OPERATIONS

  sale(gg) =
  PRE gg : GOODS THEN takings := takings + price(gg) END;

tt <-- total = tt := takings

END
