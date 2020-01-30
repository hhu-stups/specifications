MACHINE FibonacciMorphism
SETS
 Alph={a,b}
CONSTANTS fib
PROPERTIES
 fib:Alph --> seq(Alph) &
 fib(a) = [a,b] & fib(b) = [a] 
/* & 
 tribonacci:Alph --> seq(Alph) &
 tribonacci(a) = [a,b] & tribonacci(b) = [a,c] & tribonacci(c) = [a] */
VARIABLES s
INVARIANT
 s:seq(Alph)
INITIALISATION s:=[a]
OPERATIONS
  Applyfib = 
    s :=  conc((s;fib));
  sz <-- getsize = sz := size(s);
  r <-- get(i) = PRE i: 1..size(s) THEN
    r := s(i)
  END /*; 
  r <-- justfib = r := (s;fib) */
END

