MACHINE           FragileStack(ITEM, dep)

CONSTRAINTS       dep : NAT

VARIABLES         items

INVARIANT         items : seq(ITEM) & size(items) <= dep

INITIALISATION    items := <>

OPERATIONS

  putin(ii) =
  PRE
    ii : ITEM & size(items) < dep
  THEN
    items := ii -> items
  END;

ii <-- takeout =
  PRE
    items /= <>
  THEN
    items := tail(items)
    || ii := first(items)
  END

END
