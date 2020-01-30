MACHINE FibMemo
/* Computing the Fibonacci numbers using an memoization table fib */
VARIABLES fib,i
INVARIANT
  fib: 0..(i-1) --> NATURAL
INITIALISATION fib,i := {0|->0,1|->1},2
OPERATIONS
  Next = PRE i<100 THEN
           fib(i) := fib(i-1)+fib(i-2) || i:= i+1
         END
END

/* Initially we got CLPFD overflows:
   Ignoring constraint (integer overflow):
% clpfd_interface:(_145128#=1100087778366101931+679891637638612258)
This is now fixed
*/