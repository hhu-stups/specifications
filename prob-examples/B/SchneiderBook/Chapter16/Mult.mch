MACHINE           Mult

VARIABLES         nn

INVARIANT         nn : NAT1

INITIALISATION    nn := 1

OPERATIONS

vv <-- value = vv := nn ;

  mult(mm) =
  PRE mm : NAT1
  THEN nn := nn * mm
  END

END
