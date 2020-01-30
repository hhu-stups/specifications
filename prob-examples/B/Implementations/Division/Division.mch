MODEL
   Division
PROPERTIES	!(a,b,v) . (a:NAT & b:NAT1 & v:NAT => (a*b+v) mod b = v mod b) &
	   !(a,b)   . (a:NAT & b:NAT1 => (a<b => a = a mod b))

OPERATIONS
   q, r <-- div(a, b) = 
	PRE	a : NAT & b : NAT1
	THEN	q, r := a/b, a mod b
	END	
END