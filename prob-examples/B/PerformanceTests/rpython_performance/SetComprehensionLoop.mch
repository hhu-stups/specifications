/* johnwitulski$ time ./probcli -mc 2147483648 -p MAXINT 2147483648 -p MININT -2147483648 
../pyB/examples/rpython_performance/SetComprehensionLoop.mch  */

MACHINE    		SetComprehensionLoop
VARIABLES  		n, f
INVARIANT  		n:NAT & f:NAT<->NAT & max(ran(f))=n+1
INITIALISATION 	n:=99; f:={(x,y)|x:1..n & y=x+1}
OPERATIONS op = skip /* avoid deadlock */
END