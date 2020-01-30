MACHINE           Ticket

VARIABLES         serve, next

INVARIANT         serve : NAT & next : NAT & serve <= next

INITIALISATION    serve, next := 0,0

OPERATIONS

ss <-- serve_next =
  PRE serve < next
  THEN ss, serve := serve + 1, serve + 1
  END;

tt <-- take_ticket =
  BEGIN
    tt, next := next, next+1
  END

END
