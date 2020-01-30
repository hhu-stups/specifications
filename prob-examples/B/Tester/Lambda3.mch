
MACHINE Lambda3

CONSTANTS 
  fib

PROPERTIES
 fib :  0..1 --> NAT & 
 fib =  %xx.(xx:NAT & xx=0 | 1) \/
   %xx.(xx:NAT & xx = 1 | fib(0)+2) 
/*	%xx.(xx: NAT & xx=1 | 2) \/
	%xx.(xx:NAT & xx>1 & xx<5 & xx=2 | fib(xx-1) + fib(xx-2) ) */

VARIABLES
  cc
  
INVARIANT
  cc: NAT
  
INITIALISATION
  cc := 0
  
OPERATIONS
  ff <-- FibInc = BEGIN
      ff := fib(cc) ||
      cc := cc+1
     END
     
END

