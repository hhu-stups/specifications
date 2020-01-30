MACHINE           Prime

DEFINITIONS       prime_nn == ! xx . (xx : NAT => (xx : 2..nn-1 => nn mod xx /= 0))

SEES              Bool_TYPE

OPERATIONS

rep <-- prime_query(nn) =
  PRE
    nn : NAT1 & nn >= 2
  THEN
    IF prime_nn
    THEN rep := TRUE
    ELSE rep := FALSE
    END
  END

END
