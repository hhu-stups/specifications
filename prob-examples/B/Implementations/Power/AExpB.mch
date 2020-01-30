MODEL		AExpB
OPERATIONS
  res <-- power(a, b) =
	PRE	a:NAT & b:NAT & a**b:NAT
	THEN	res := a**b
	END

END