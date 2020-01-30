MACHINE           Booth

SETS              CUSTOMER; SEAT

VARIABLES         reserved, tickets

INVARIANT         reserved : CUSTOMER --> NAT
                  & tickets : SEAT +-> CUSTOMER

INITIALISATION    reserved := CUSTOMER * {0} || tickets := {}

OPERATIONS

reserve(cc,nn) =
  PRE cc : CUSTOMER & nn : NAT1 
  THEN reserved(cc) := reserved(cc) + nn 
  END;

collect(cc) =
  PRE cc : CUSTOMER & reserved(cc) > 0
  THEN ANY ss 
       WHERE ss <: SEAT & card(ss) = reserved(cc) & ss /\ dom(tickets) = {}
       THEN tickets := tickets \/ (ss * {cc})
            || reserved(cc) := 0
       END
  END      


END
