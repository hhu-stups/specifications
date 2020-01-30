MACHINE           Fifo(ELEM,cap)

CONSTRAINTS       cap : NAT1

VARIABLES         contents

INVARIANT         contents : seq(ELEM) & size(contents) <= cap

INITIALISATION    contents := <>

OPERATIONS

  input(ee) =
  PRE ee : ELEM & size(contents) < cap
  THEN contents := contents <- ee
  END;

ee <-- output =
  PRE size(contents) > 0
  THEN ee := first(contents) || contents := tail(contents)
  END


END
