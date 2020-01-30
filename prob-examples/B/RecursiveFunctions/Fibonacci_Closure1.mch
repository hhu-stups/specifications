MACHINE Fibonacci_Closure1
/* An encoding of recursion using closure1 */
ABSTRACT_CONSTANTS fib_expand, fib
PROPERTIES
 fib_expand = %(x,lim,x1,x2).(x<lim|(x+1,lim,x1+x2,x1)) &
 fib = dom({x,r,c|x:NATURAL1 & c=closure1(fib_expand)[{(0,x,1,0)}] & (x,x,r):dom(c)})
VARIABLES xx
INVARIANT
 xx:NATURAL1
INITIALISATION xx:=2
OPERATIONS
  r <-- ComputeFib(x) = PRE xx=x THEN r:= fib(x) || xx:=xx+1 END
END

