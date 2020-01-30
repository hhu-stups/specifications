SYSTEM toy
VARIABLES
  aa, bb
INVARIANT
  aa : NAT &
  bb : NAT &
  aa = bb
INITIALIZATION
  aa, bb := 0, 0
EVENTS
  ev1 = ANY xx WHERE xx : NAT THEN aa, bb := xx, xx END
END