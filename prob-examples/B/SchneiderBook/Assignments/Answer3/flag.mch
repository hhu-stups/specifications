MACHINE           Flag

SETS              COLOUR = {red, white, blue}

CONSTANTS         num

PROPERTIES        num : NAT1

VARIABLES         colours

INVARIANT         colours : 1..num --> COLOUR

INITIALISATION    colours :: 1..num --> COLOUR

OPERATIONS

  sort =
  ANY carr
  WHERE carr : 1..num --> COLOUR
        & ! cc . (cc : COLOUR => (card(colours |> {cc}) = card(carr |> {cc})))
        & # (ii,jj) . (ii : 0..num & jj : 0..num & ii <= jj & carr([1..ii]) = {red} & carr([ii+1..jj]) = {white} & carr([jj+1..num]) = {blue})
  THEN colours := carr
  END

END
