MACHINE Test_corrected
/* ProB and AtelierB support the BOOL type; use this to synchronise with 
   the CSP boolean values true and false */

SETS
    REPORT = {YES, NO}

OPERATIONS
  bb <--   fail(in) = 
  PRE in : NAT THEN
      IF (in : 1..3) THEN
           bb := TRUE
      ELSE
           bb := FALSE
      END
  END;

  rr <-- pass(in) = 
 PRE in : NAT THEN
      IF (in : 1..3) THEN
           rr := YES
      ELSE
           rr := NO
      END
  END

END


