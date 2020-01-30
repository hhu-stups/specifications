MACHINE phonebook_seq

SETS
	Name; Code 

VARIABLES db, history

DEFINITIONS
    scope_Name == 1..2;
    scope_Code == 4..6
    
INVARIANT
		db : Name +-> Code &
                history: seq(Name)

INITIALISATION  
	db,history := {},[]
	
OPERATIONS

add(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn /: dom(db) 
	THEN
		db := db \/ { nn |-> cc} || history := history^[nn]
	END;

cc <-- get_unused_names =
         cc := Name - dom(db);

cc <-- top_history =
       PRE
          history /= []
       THEN
          cc := first(history)
       END;

cc <-- last_history =
       PRE
          history /= []
       THEN
          cc := last(history)
       END;

cc <-- last_history2 =
       PRE
          history /= []
       THEN
          cc := first(rev(history))
       END;
tail_history =
       PRE
          history /= []
       THEN
          history := tail(history)
       END;

front_history =
       PRE
          history /= []
       THEN
          history := front(history)
       END;

cc <-- lookup(nn) =
	PRE
		nn: Name & nn : dom(db)
	THEN
		cc:=db(nn)
	END;


update(nn,cc) =
	PRE
		nn:Name & cc:Code  &
		nn : dom(db)
	THEN
		db(nn) := cc || history := history^[nn]
	END

END

