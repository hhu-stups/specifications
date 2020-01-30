MACHINE           Counter

VARIABLES         counter

INVARIANT         counter : NAT

INITIALISATION    counter :: NAT

OPERATIONS

nn <-- number = nn := counter;

zero = counter := 0;

  inc = counter := counter + 1;

  dec =
  PRE counter > 0
  THEN counter := counter - 1
  END

END
