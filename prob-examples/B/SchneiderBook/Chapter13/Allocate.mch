MACHINE           Allocate

/* SEES              Bool_TYPE */

VARIABLES         allocated

INVARIANT         allocated <: NAT1

INITIALISATION    allocated := {}

OPERATIONS

  choose(nn) =
  PRE nn : NAT1 & nn /: allocated
  THEN allocated := allocated \/ {nn}
  END;

aa <-- query(nn) =
  PRE nn : NAT1
  THEN IF nn : allocated THEN aa := TRUE ELSE aa := FALSE END
  END;

nn <-- allocate = 
  ANY mm 
  WHERE mm : NAT1 - allocated 
  THEN nn := mm || allocated := allocated \/ {mm} END 

END










