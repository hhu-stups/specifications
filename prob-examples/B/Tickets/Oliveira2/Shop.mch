MACHINE           Shop

SEES              Price, Goods

VARIABLES         takings

INVARIANT         takings : NAT

INITIALISATION    takings := 0

OPERATIONS

  sale(gg) =
  PRE gg : GOODS & takings + price(gg) <= 2147483647 THEN takings := takings + price(gg) END;

tt <-- total = tt := takings

END
