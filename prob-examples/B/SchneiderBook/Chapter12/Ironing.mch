MACHINE           Ironing //(limit)

//SEES              Bool_TYPE
//CONSTRAINTS       limit : NAT1 // moved limit to CONSTANTS for visibility in Atelier-B
CONSTANTS limit
PROPERTIES limit : NAT1

SETS              ITEM

VARIABLES         pile

INVARIANT         pile : seq(ITEM) & size(pile) <= limit

INITIALISATION    pile := <>

OPERATIONS

  put(ii) =
  PRE ii : ITEM & size(pile) < limit
  THEN pile := pile <- ii
  END;

ii <-- take =
  PRE pile /= <>
  THEN pile := front(pile) || ii := last(pile)
  END;

bb <-- query(ii) =
  PRE ii : ITEM
  THEN bb := bool(ii : ran(pile))
  END

END
