MACHINE Factorial
ABSTRACT_CONSTANTS
 fact
PROPERTIES
 fact = {x,y | x:NATURAL & y:NATURAL & 
	(x=0 => y=1) & 
	(x>0 => (y=x*fact(x-1)))
 } &
 fact: INTEGER <-> INTEGER 
OPERATIONS
  test = skip; 
  rr <-- apply_fact(xx) = PRE xx:NAT & (xx = 0 or xx = 2 or xx = 3 or xx=4) THEN rr := fact(xx) END;
  rr <-- apply_fact_0 = BEGIN rr := fact(0) END;
  rr <-- apply_fact_5 = BEGIN rr := fact(5) END;
  rr <-- apply_fact_10 = BEGIN rr := fact(10) END;
  rr <-- apply_fact_20 = BEGIN rr := fact(20) END;
  rr <-- apply_fact_100 = BEGIN rr := fact(100) END

END