MACHINE           Hotel(sze)

SEES              ROOM_ctx

CONSTRAINTS       sze : NAT1

CONSTANTS         small

PROPERTIES        card(ROOM) = sze & small <: ROOM

VARIABLES         numbers

INVARIANT         numbers : ROOM --> 0..6 & numbers[small] <: 0..4

INITIALISATION    numbers := ROOM * {0}

OPERATIONS

  checkin(rr,nn) =
  PRE rr : ROOM & nn : 1..6 & numbers(rr) = 0 & (rr : small => nn <= 4)
  THEN numbers(rr) := nn
  END;

  checkout(rr) = 
  PRE rr : ROOM
  THEN numbers(rr) := 0 
  END;

nn <-- roomquery(rr) = 
  PRE rr : ROOM
  THEN nn := numbers(rr) 
  END;

nn <-- vacancies = nn := card(numbers |> {0});

nn <-- totalguests = nn := SIGMA ( zz ) . (zz : ROOM | numbers(zz));
 
swap(rr,ss) = 
  PRE rr : ROOM & ss : ROOM & ((rr : small) <=> (ss : small))
  THEN numbers := numbers <+ {rr |-> numbers(ss),ss|-> numbers(rr)}
  END

END


