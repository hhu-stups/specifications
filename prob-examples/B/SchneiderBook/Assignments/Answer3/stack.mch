MACHINE           Stack(ELEM, maxdepth)

CONSTRAINTS       maxdepth : NAT1

SETS              RESPONSE = {yes, no}

VARIABLES         stack

INVARIANT         stack : seq(ELEM) & size(stack) <= maxdepth

INITIALISATION    stack := <>

OPERATIONS

  push(ee) =
  PRE
    ee : ELEM & size(stack) < maxdepth
  THEN
    stack := ee -> stack
  END;

ee <-- pop =
  PRE
    size(stack) > 0
  THEN
    ee := first(stack)
    || stack := tail(stack)
  END;

rr <-- emptyquery =
  PRE
    true
  THEN
    IF stack = <>
    THEN rr := yes
    ELSE rr := no
    END
  END;

rr <-- fullquery =
  PRE
    true
  THEN
    IF size(stack) = maxdepth
    THEN rr := yes
    ELSE rr := no
    END
  END

END
