MACHINE Hotel

SETS
  ROOMS; CLIENTS; TYPE = {single,double,penth}
DEFINITIONS
   Date == 1..7
CONSTANTS Type
PROPERTIES
 Type: ROOMS --> TYPE
VARIABLES booked
INVARIANT
  booked: (ROOMS*Date) +-> CLIENTS
INITIALISATION
  booked := {}
OPERATIONS
  res <-- IsClient(C) = PRE C:CLIENTS THEN
     IF C: ran(booked) THEN res:= TRUE ELSE res:= FALSE END
  END;
  room <-- FindFreeRoom(T, StartDate,EndDate) = PRE  T:TYPE & StartDate:Date & EndDate:Date & EndDate>StartDate THEN
     ANY Room WHERE Room:ROOMS & Type(Room)=T & !x.(x:StartDate..EndDate-1 => Room|->x /: dom(booked)) THEN
        room := Room
     END
  END;

  Book(Client,Room,StartDate,EndDate) = PRE StartDate:Date & EndDate:Date & EndDate>StartDate &
       Client: CLIENTS & Room: ROOMS &
	   !x.(x:StartDate..EndDate-1 => Room|->x /: dom(booked)) THEN
	booked := booked \/ %(r,x).(r:ROOMS & r=Room & x:StartDate..EndDate-1|Client)
  END
END

