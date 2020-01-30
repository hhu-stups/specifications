MACHINE           Array(cap)
DEFINITIONS SET_PREF_MAX_INITIALISATIONS == 30
CONSTRAINTS cap:NAT1 /* added by leuschel */

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
