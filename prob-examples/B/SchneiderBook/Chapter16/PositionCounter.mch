MACHINE           PositionCounter(maximum)

CONSTRAINTS        maximum : NAT1

VARIABLES         pos

INVARIANT         pos : NAT1 & pos <= maximum

INITIALISATION    pos := 1

OPERATIONS

  posinc = pos := (pos mod maximum) + 1;

pp <-- posget = pp := pos

END
