MACHINE           Rooms

SETS              ROOM; SIZE = {little, big}

CONSTANTS         small, price, defaultprice

PROPERTIES        small <: ROOM & price : ROOM --> NAT1 & defaultprice : NAT1 
                  & price[small] <: {defaultprice} & price[ROOM-small] <: {defaultprice * 3/2}

OPERATIONS

ss <-- sizequery(rr) =
  PRE rr : ROOM
  THEN IF rr : small
       THEN ss := little
       ELSE ss := big
       END
  END;

pp <-- pricequery(rr) =
  PRE rr : ROOM
  THEN pp := price(rr)
  END

END
