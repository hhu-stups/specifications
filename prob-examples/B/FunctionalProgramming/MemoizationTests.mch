MACHINE MemoizationTests
ABSTRACT_CONSTANTS
  prime /*@desc memo */,
  fib /*@desc memo */,
  fact /*@desc memo */,
  factnomemo,
  graph,
  sum /*@desc memo */,
  evenupto /*@desc memo */,
  M91 /*@desc memo */
DEFINITIONS
  "CHOOSE.def"
PROPERTIES
  prime = %x.(x:NATURAL | IF !y.(y:2..(x-1) => x mod y /= 0) THEN TRUE ELSE FALSE END)
  &
  fib = %x.(x:NATURAL |
           (IF x=0 or x=1 THEN 1
           ELSE fib(x-1)+fib(x-2)
           END))
  &
  fact = %x.(x:NATURAL|(IF x=0 THEN 1 ELSE x*fact(x-1) END))
  &
  factnomemo = %x.(x:NATURAL|(IF x=0 THEN 1 ELSE x*factnomemo(x-1) END))
  &
  evenupto = %x.(x:NATURAL|{y|y:1..x & y mod 2 = 0})
  &
  graph = {x,y|{x,y}<:1..100 & y:{x*x,x+x}}
  &
  sum = %x.(x:POW(INTEGER)| IF x={} THEN 0 ELSE CHOOSE(x)+sum(x \ {CHOOSE(x)}) END )
  &
  // McCarthy 91 function
  M91 = %x.(x:INTEGER| IF x>100 THEN x-10 ELSE M91(M91(x+11)) END)
ASSERTIONS
  prime(13)=TRUE;
  prime(14)=FALSE;
  card({x|x:2..1000 & prime(x)=TRUE}) = 168;
  fib(20)=10946;
  fib(25)=121393;
  fib(30)=1346269;
  fib[28..30] = {514229,832040,1346269};
  30|->1346269 : fib;
  30|->1346268 /: fib;
  {x| 30|->x:fib} = {1346269};
  fact(10)=factnomemo(10);

  evenupto: NATURAL +-> POW(INTEGER);
  sum(1..1000) = 500500;

  M91(99) = 91;
  M91(87) = 91;
  !x.(x:1..101 => M91(x)=91)
END


/*
fib(10000) -> 267 / 419 ms
*/
