MACHINE           Keys

SETS              KEY = {key1,key2,key3}

VARIABLES         keys

INVARIANT         keys <: KEY

INITIALISATION    keys := {}

OPERATIONS

  insertkey(kk) =
  PRE kk : KEY THEN keys := keys \/ {kk} END;

  removekey(kk) =
  PRE kk : KEY THEN keys := keys - {kk} END

END
