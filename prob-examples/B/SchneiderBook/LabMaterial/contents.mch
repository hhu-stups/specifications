MACHINE           Contents(nn)

SETS              ITEM; BOX

PROPERTIES        card(BOX) = nn

VARIABLES         location

INVARIANT         location : ITEM +-> BOX

INITIALISATION    location := {}

OPERATIONS

  deposit(box, item) =
  PRE
    box : BOX & item : ITEM & item /: dom(location)
  THEN location := location \/ {item |-> box}
  END;

  withdraw(box, item) =
  PRE 
    box : BOX & item : ITEM & item |-> box : location
  THEN location := location - {item |-> box}
  END;
 
  empty(box) =
  PRE
    box : BOX
  THEN
    location := location |>> {box}
  END;

bb <-- find(item) =
  PRE
    item : ITEM & item : dom(location)
  THEN
    bb := location(item)    
  END

END
