MACHINE           Buffer(ELEM)

SETS              RESPONSE = {yes, no}

CONSTANTS         capacity

PROPERTIES        capacity : NAT1

VARIABLES         contents

INVARIANT         contents : seq(ELEM)

INITIALISATION    contents := <>

OPERATIONS

  add(ee) =
  PRE
    ee : ELEM & size(contents) < capacity
  THEN
    contents := contents <- ee
  END;

ee <-- remove =
  PRE
    size(contents) > 0
  THEN
    ee := first(contents)
    || contents := tail(contents)
  END;

rr <-- emptyquery =
  PRE
    true
  THEN
    IF contents = <>
    THEN rr := yes
    ELSE rr := no
    END
  END;

rr <-- fullquery =
  PRE
    true
  THEN
    IF size(contents) = capacity
    THEN rr := yes
    ELSE rr := no
    END
  END

END
