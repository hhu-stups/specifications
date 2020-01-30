MACHINE           Numset(maxsize)

VARIABLES         numset

INVARIANT         numset <: NAT

INITIALISATION    numset := {}

OPERATIONS

  enter(nn) =
  PRE
    nn : NAT & nn /: numset & nn < maxsize
  THEN
    numset := numset \/ {nn}
  END;

ans <-- sze = ans := card(numset);

nn <-- maximum = 
  PRE
    numset /= {}
  THEN
    nn := max(numset)
  END;

reset = numset := {}

END
