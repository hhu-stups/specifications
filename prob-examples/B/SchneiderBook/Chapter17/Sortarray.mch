MACHINE           Sortarray(cap)
CONSTRAINTS cap:NAT1 /* added by leuschel */

VARIABLES         aa

INVARIANT         aa : 1..cap --> NAT

INITIALISATION    aa :: 1..cap --> NAT

OPERATIONS

  set(ii,nn) =
  PRE ii : 1..cap & nn : NAT
  THEN aa(ii) := nn
  END;

nn <-- get(ii) =
  PRE ii : 1..cap
  THEN nn := aa(ii)
  END;

  sort =
  ANY pp
  WHERE pp : 1..cap >->> 1..cap & 
        ! ii . (ii : 1..cap-1 => (pp;aa)(ii) <= (pp;aa)(ii+1))
  THEN aa := (pp;aa)
  END  

END
