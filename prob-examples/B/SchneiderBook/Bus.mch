MACHINE           Bus

VARIABLES         tickets, passengers

INVARIANT         tickets : NAT & passengers : NAT & tickets <= passengers 

INITIALISATION    tickets, passengers := 0,0

OPERATIONS

buy(mm) =
  PRE mm : NAT & tickets + mm <= passengers
  THEN tickets := tickets + mm
  END;

board(nn) =
  PRE nn : NAT
  THEN passengers := passengers + nn
  END;

dble =
  BEGIN
   tickets, passengers := 2*tickets, 2*passengers
  END

END
