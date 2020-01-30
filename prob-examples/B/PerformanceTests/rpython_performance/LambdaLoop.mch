/* johnwitulski$ time ./probcli -mc 2147483648 -p MAXINT 2147483648 -p MININT -2147483648 
../pyB/examples/rpython_performance/LambdaLoop.mch  */

MACHINE    		LambdaLoop
VARIABLES  		n, f 
INVARIANT  		n:NAT & f:NAT<->NAT & max(ran(f))=n
INITIALISATION 	n:=100000; f:=%x.(x:1..n-1 | x+1) 
OPERATIONS op = skip /* avoid deadlock */
END