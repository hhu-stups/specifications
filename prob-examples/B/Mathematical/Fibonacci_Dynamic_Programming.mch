MACHINE Fibonacci_Dynamic_Programming
/* an encoding of Fibonacci where we get dynamic programming for free from ProB */
/*
 n     DOM      ProB    Kodkod
 10    1..100   0.01    1.93 sec
 11    1..200   0.01    5.15 sec

 10    INTEGER  0.01    impossible
 20    INTEGER  0.01    impossible  -> 10946
 40    INTEGER  0.01    impossible  -> 165580141
100    INTEGER  0.02    impossible  -> 573147844013817084101
200    INTEGER  0.06    impossible  -> 453973694165307953197296969697410619233826
*/
DEFINITIONS
  DOM == INTEGER; /* INTEGER : For ProB no restriction necessary; for Kodkod yes */
CONSTANTS n, fib, sol
PROPERTIES
  fib : 0..n --> DOM &
  fib(0) = 1 & fib(1) = 1 &
  !x.(x:2..n => fib(x) = fib(x-1) + fib(x-2))

  & n = 200 & sol = fib(n)
END

