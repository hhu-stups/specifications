MACHINE FactorialNonSym
DEFINITIONS
  SET_PREF_SYMBOLIC == FALSE;
  SET_PREF_MAXINT == 100
CONSTANTS
 fact
PROPERTIES
 fact: NAT --> NATURAL &
 fact(0) = 1 &
 !x.(x:NAT1 => fact(x) = x*fact(x-1))
OPERATIONS
  test = skip; 
  rr <-- apply_fact(xx) = PRE xx:NAT & (xx = 0 or xx = 2 or xx = 3 or xx=4) THEN rr := fact(xx) END;
  rr <-- apply_fact_0 = BEGIN rr := fact(0) END;
  rr <-- apply_fact_5 = BEGIN rr := fact(5) END
END