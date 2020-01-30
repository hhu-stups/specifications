MODEL PowerM

/*PROPERTIES !(m,n).(m:INTEGER & n: NATURAL =>  m**n = m*m**(n-1))*/
DEFINITIONS
 SET_PREF_MAXINT==10;
 SET_PREF_MAX_OPERATIONS==35

OPERATIONS
   res <-- power(a,b) = PRE a:NAT & b:NAT & a**b:NAT THEN
     res := a**b
   END

END

/*
IMPLEMENTATION
   PowerMImp

REFINES PowerM

res <-- power(a,b) = 
	VAR x,y IN 
		x := 1;
		y := b;
		WHILE y>0 DO
		END
	END

END*/