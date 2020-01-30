MACHINE  Prime
DEFINITIONS
 SET_PREF_MAXINT == 20;
 SET_PREF_MAX_OPERATIONS == 200
OPERATIONS
  r <-- IsPrime(x) = PRE x:NAT & x>1 THEN
      IF #d.(d:NAT & d>1 & d<x & x mod d = 0) THEN
        r := FALSE
      ELSE
        r := TRUE
      END 
   END
END