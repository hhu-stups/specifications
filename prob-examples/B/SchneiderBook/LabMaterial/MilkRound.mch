MACHINE           MilkRound(length)

VARIABLES         round

SEES              Bool_TYPE

INVARIANT         round : 1..length --> NAT

INITIALISATION    round := (1..length) * {0}

OPERATIONS

  add(ii,ee) =
  PRE
    ii : 1..length & ee : NAT
  THEN
    round(ii) := ee
  END;

ee <-- request(ii) =
  PRE
    ii : 1..length
  THEN
    ee := round(ii)
  END;

nn <-- total =
  PRE
    true
  THEN
    nn := SIGMA (zz) . (zz : 1..length | round(zz))
  END

END
