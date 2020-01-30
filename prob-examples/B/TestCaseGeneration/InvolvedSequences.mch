MACHINE InvolvedSequences
/* a model where finding a particular sequence of events (e.g., 
   BookFlight;BookReturnFlight;BookHotel;BookHotel) is not entirely trivial */
SETS
 PERSON; HOTEL; FLIGHT; TOWN
DEFINITIONS
 RET(a,b) == prj1(TOWN,TOWN)(a) = prj2(TOWN,TOWN)(b) & prj2(TOWN,TOWN)(a) = prj1(TOWN,TOWN)(b)
CONSTANTS flight, hotel_town
PROPERTIES
 flight : FLIGHT --> (TOWN * TOWN) &
 !f.(f:FLIGHT => prj1(TOWN,TOWN)(flight(f)) /=  prj2(TOWN,TOWN)(flight(f))) &
 hotel_town : HOTEL --> TOWN 
VARIABLES bookh, bookf
INVARIANT
 bookh: PERSON <-> HOTEL &
 bookf: PERSON <-> FLIGHT
INITIALISATION bookh,bookf := {},{}
OPERATIONS
  BookHotel(p,h) = PRE p:PERSON & h:HOTEL & p|->h /: bookh & 
      #f.(f:FLIGHT & p|->f:bookf & prj2(TOWN,TOWN)(flight(f))=hotel_town(h)) THEN
     bookh := bookh \/ {p|->h}
  END;
  BookFlight(p,f) = PRE p:PERSON & f:FLIGHT & p|->f /: bookf THEN
     bookf := bookf \/ {p|->f}
  END;
  BookReturnFlight(p,f,f2) = PRE p|->f /: bookf & p|->f2 : bookf & RET(flight(f),flight(f2)) THEN
     bookf := bookf \/ {p|->f}
  END
END

