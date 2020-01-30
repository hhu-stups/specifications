MACHINE Fibonacci_NewSyntax
/* Version using new syntax */
/* 440 ms for fib(20), 330 ms for fib(19) vs 2.3 seconds for Fibonacci old version */
ABSTRACT_CONSTANTS
 fib
PROPERTIES
 fib = %x.(x:NATURAL |
           (IF x=0 or x=1 THEN 1
           ELSE fib(x-1)+fib(x-2)
           END)) &

 fib: NATURAL --> INTEGER 
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