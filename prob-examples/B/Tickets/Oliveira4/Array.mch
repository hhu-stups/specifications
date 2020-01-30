MACHINE           Array(cap)
/* CONSTRAINTS cap : NAT1 */
VARIABLES         array

INVARIANT         array : 1..cap --> NAT

INITIALISATION    array :: 1..cap --> NAT

OPERATIONS

  set(ii,nn) =
  PRE ii : 1..cap & nn : NAT
  THEN array(ii) := nn
  END;

nn <-- get(ii) =
  PRE ii : 1..cap
  THEN nn := array(ii)
  END

END
