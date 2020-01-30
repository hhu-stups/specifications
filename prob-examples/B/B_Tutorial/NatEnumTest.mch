MACHINE NatEnumTest

VARIABLES
 xx
INVARIANT
 xx:INT
 
INITIALISATION
 xx::NAT
 
OPERATIONS

 /* set_int = BEGIN xx::INT END ; */
 set_int(yy) = PRE yy:INT THEN xx := yy END;
 set_int_explicit = BEGIN xx := 1234 END;
 set_nat(ss) = PRE ss: POW(NAT) THEN xx :: ss END

END