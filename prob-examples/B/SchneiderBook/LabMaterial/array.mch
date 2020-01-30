MACHINE           Array(sze)

CONSTRAINTS       sze : NAT

VARIABLES         arr

INVARIANT         arr : 1..sze --> NAT

INITIALISATION    arr :: 1..sze --> NAT

OPERATIONS

  enter(ii,ee) =
  PRE
    ii : 1..sze & ee : NAT
  THEN
    arr(ii) := ee
  END;

ee <-- query(ii) =
  PRE
    ii : 1..sze
  THEN
    ee := arr(ii)
  END

END
