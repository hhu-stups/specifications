MACHINE           SmallSet

CONSTANTS         maxsize

PROPERTIES        maxsize : NAT1

VARIABLES         numset

INVARIANT         numset <: NAT1 & card(numset) <= maxsize

INITIALISATION    numset := {}

OPERATIONS

  enter(nn) =
  PRE
    nn : NAT1 & card(numset) < maxsize
  THEN
    numset := numset \/ {nn}
  END;

/* observe that numbers already in the set can be entered again.  
   This will not change the size of the set
*/

  remove(nn) =
  PRE
    nn : numset
  THEN
    numset := numset - {nn}
  END;

nn <-- minimum =
  PRE
    numset /= {}
  THEN
    nn := min(numset)
  END

END
