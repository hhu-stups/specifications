MACHINE           Colours(SPECTRUM, arrsize)

CONSTRAINTS       arrsize : NAT1

VARIABLES         cols

INVARIANT         cols : 1..arrsize --> SPECTRUM

INITIALISATION    cols :: 1..arrsize --> SPECTRUM

OPERATIONS

cc <-- read_colour(ii) =
  PRE
    ii : 1..arrsize
  THEN
    cc := cols(ii)
  END;

  swap(ii,jj) =
  PRE
    ii : 1..arrsize & jj : 1..arrsize
  THEN
    cols := cols <+ {ii |-> cols(jj), jj |-> cols(ii)}
  END

END
