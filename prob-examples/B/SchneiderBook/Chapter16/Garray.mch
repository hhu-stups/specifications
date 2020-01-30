MACHINE           Garray(ITEM)

VARIABLES         garray

INVARIANT         garray : ITEM --> ITEM

INITIALISATION    garray := id(ITEM)

OPERATIONS

  set(ii,jj) = 
  PRE ii : ITEM & jj : ITEM
  THEN garray(ii) := jj
  END;

jj <-- get(ii) =
  PRE ii : ITEM
  THEN jj := garray(ii)
  END 

END
