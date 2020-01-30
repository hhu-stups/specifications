MACHINE Test


SETS
    REPORT = {YES, NO};
    Bool_TYPE = {true,false}  /* this does not synchronise with CSP booleans; use BOOL instead */

OPERATIONS
  bb <--   fail(in) = 
  PRE in : NAT THEN
      IF (in : 1..3) THEN
           bb := true
      ELSE
           bb := false
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


