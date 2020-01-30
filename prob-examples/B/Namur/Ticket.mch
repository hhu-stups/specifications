MACHINE Ticket
 /* Question: what is missing here for the proof to go through ? */
DEFINITIONS
 SET_PREF_MAXINT == 11
VARIABLES serve, next, record, limit

INVARIANT serve : NAT & next : NAT & record : NAT & limit : NAT1 
     & serve <= next & next <= limit

INITIALISATION serve, next, record, limit := 0,0,0,10

OPERATIONS
  ss <-- serve_next =
     PRE serve < next
     THEN ss,serve,record := serve+1, serve+1, 0
     END;

  tt <-- take_ticket =
     PRE next < limit
     THEN tt,next,record := next,next+1,record+1
     END;

  ll <-- set_limit(nn) =       /* Aufgabe c.) */
     PRE nn : NAT1 & nn>= next
     THEN ll,limit := nn,nn
     END;

  ww <-- waiting =             /* Aufgabe a.) */
     ww := next-serve;

  rr <-- new_waiting =         /* Aufgabe b.) */
     rr := record
END