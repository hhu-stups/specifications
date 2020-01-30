MACHINE Fibonacci
/* IMPORTANT:
 set the advanced preference "look for abort conditons" to FALSE !
Otherwise not_in_domain will be called which currently expands closures  */
DEFINITIONS
  SET_PREF_SYMBOLIC == TRUE;
  SET_PREF_RECURSIVE == TRUE;
  SET_PREF_EXPAND_CLOSURES_FOR_STATE == FALSE
ABSTRACT_CONSTANTS
 fib
PROPERTIES
 fib = {x,z| x:NATURAL & z:NATURAL &
	(x=0 => z=1) & 
	(x=1 => z=1) & 
	(x>1 => (z=fib(x-1)+fib(x-2)))
 } &
 fib: INTEGER <-> INTEGER 
OPERATIONS
  test = skip; 
  rr <-- apply_fib(xx) = PRE xx:NAT & (xx = 0 or xx = 2 or xx = 3 or xx=4) THEN rr := fib(xx) END;
  rr <-- apply_fib_0 = BEGIN rr := fib(0) END;
  rr <-- apply_fib_5 = BEGIN rr := fib(5) END;
  rr <-- apply_fib_10 = BEGIN rr := fib(10) END;
  rr <-- apply_fib_15 = BEGIN rr := fib(15) END;
  rr <-- apply_fib_19 = BEGIN rr := fib(19) END;
  rr <-- apply_fib_20 = BEGIN rr := fib(20) END 

END