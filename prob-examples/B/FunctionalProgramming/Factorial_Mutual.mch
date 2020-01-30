MACHINE Factorial
/* IMPORTANT:
 set the advanced preference "look for abort conditons" to FALSE !
Otherwise not_in_domain will be called which currently expands closures  */
ABSTRACT_CONSTANTS
 fact1,fact2
PROPERTIES
 fact1 = {x,y| x:NAT & y:NAT & 
	(x=0 => y=1) & 
	(x>0 => (y=x*fact2(x-1)))
 } &
 fact1: INT <-> INT &
 fact2 = {x,y| x:NAT & y:NAT & 
	(x=0 => y=1) & 
	(x>0 => (y=x*fact1(x-1)))
 } &
 fact2: INT <-> INT 
OPERATIONS
  rr <-- apply_fact(xx) = PRE xx:NAT & (xx = 0 or xx = 2 or xx = 3 or xx=4) THEN rr := fact1(xx) END;
  rr <-- apply_fact_5 = BEGIN rr := fact2(5) END;
  rr <-- apply_fact_0 = BEGIN rr := fact1(0) END 

END