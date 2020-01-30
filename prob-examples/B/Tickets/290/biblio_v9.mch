MACHINE biblio_v9

/*====================================*/
/*  B machine produced by Eric Gaudet  */
/*  University of Sherbrooke          */
/*  July 21, 2009                     */
/*
	B machine to represent a library and some of the operations
	that can be done in it. The primary utility of this machine 
	is to compare the model checking between many langage in the
	research lead by M. Marc Frappier with EB3.
*/
/*====================================*/

SETS
    /*MEMBERID = {m1,m2,m3};*/ /*Members of the library*/
    /*BOOKID = {b1,b2,b3}*/    /*Books of the library*/
	MEMBERID = {m1};
	BOOKID = {b1}
   
CONSTANTS 
    maxBooks  /*Maximum of books a member can borrow*/

PROPERTIES 
    maxBooks : NATURAL & maxBooks = 2

DEFINITIONS
    /*ASSERT_LTL == "G ([Join] => X e(Leave))"*/
	/*ASSERT_LTL == "F (e(Acquire))"*/
	/*ASSERT_LTL == "not (e(Discard)) U ( { book /: dom(lend) } & { book /: dom(reservation) })"*/
	/*ASSERT_LTL == "(not (e(Lend))) U (e(Leave))*/
	/*ASSERT_LTL == [AuthorizeAcq] => X(e(Acquire) & e(CancelAcq))*/
	/*ASSERT_LTL == [SystemON] => X([Join] or [AuthorizeAcq] or [SystemOFF])*/
	ASSERT_LTL == "G( [SystemON] => F{State=TRUE})";


	/*+==========================================================+*/
	/*
	#1	ASSERT_LTL == G(({b1 /: book} & {b1 : bookacq}) => (e(Acquire)) = TRUE)
				   == F([Acquire(b1)]) => (not([Acquire(b1)]) U [Discard(b1)])
	
	#2  ASSERT_LTL == G((e(AuthorizeDiscard)) = TRUE => XF(e(Discard)) = TRUE)
				   ==[Acquire] => not[Discard] U ({lend(b1) = {}} & {reserve(b1) = {}})
								=> F(Discard)??
	
	#3  ASSERT_LTL == G(((e(Lend(m1,_))) = FALSE) => ({m1 /: member} = FALSE))
				   == G( not([Lend]) U ([Join]) ) & [Leave] => G( not([Lend]) U ([Join]))
	
	#4  ASSERT_LTL == G(({b1 : dom(lend)} or {card(reservation(b1)) >= 1}) => XF(e(Reserve)) = TRUE)
				   == G((([lend(m1,b1)]) or ([Reserve(m1,b1)])) => F([Reserve(m2,b2)])) 
	
	#5  ASSERT_LTL == G([Lend(m1,b1)] => (e(Reserve(m1,b1))) = FALSE)
				   == G([Lend] => ( G(not([Reserve])) U ([Return]) ) )
	
	#6  ASSERT_LTL == G([Reserve] => not[Reserve] U ([CancelReserve] or [Take]))
				   == 
	
	#7  ASSERT_LTL == G([Reserve] => not[Lend])
	
	#8  ASSERT_LTL == G([Reserve] => not[Renew])

	#7&8 => Un livre réservé doit être emprunté ou bien sa réservation doit être annulée
		ASSERT_LTL == G([Reserve(b1)] => X(F([Take(b1)] or [CancelReserve(b1)])))

	#9  NONE
	
	#10 ASSERT_LTL == G((e(Take)) => [Take])
				   == 
	
	#11 ASSERT_LTL == G((not[Take] or not[Lend]) U [Return])
				   == G((not[Take]) U [Return])
	
	#12 ASSERT_LTL == G([Reserve] => (not[Take] => [CancelReserve]))
				   == G([Reserve] => (([CancelReserve]) U ([Take])))
	
	#13 ASSERT_LTL == G( [Join] => 
							(not(Leave))
							U( G( 
								F( 
									([Lend] X F([Return])) 
								or 
									([Reserve] X F( [CancelReserve] or [Take] ) X F([Return]))
								)
							))
	
	#14	ASSERT_LTL == G([Join] => F[Leave])
				   == G(not([Leave]) U [Join])
	
	#15 ASSERT_LTL == F([Consult])
	
	#16 ASSERT_LTL == F([Consult])
	
	#17 ASSERT_LTL == F([Consult])
	
	#18 ASSERT_LTL == ((e(Lend)) = FALSE => maxBooks)	
				   == G((([Lend(m1,b1)]) X ([Lend(m1,b2)])) => (not([Lend(m1,b3)])) U ([Return(m1,bx)]))
	*/
	/*+============================================================+*/


VARIABLES
    lend,
    member,
    book,
	bookacq,        /*Contains the book that are AUTHORIZE to be acquire*/
	bookDiscard,    /*Contains the book that are AUTHORIZE to be discard*/
	reservation,    /*Contains a list of reservation for a book*/
	numReserv,      /*Contains a number to sequence the members in the list of reservation*/
    precious,       /*==NO USE FOR NOW== Used to tell if a book is precious or not*/
	State		/*Variable to stop the system in a stable state (empty state)*/
    
    
INVARIANT
    member <: MEMBERID & 
    book <: BOOKID &
	bookacq <: BOOKID &
	bookDiscard <: BOOKID &
    lend : book +-> member &
    !xm.( xm:member => card(lend |> {xm}) <= maxBooks ) &  /*A member can't borrow more than the maxBooks of the system*/

	reservation : book <-> member &
	numReserv : reservation --> INTEGER &
    precious : book +-> BOOL &
	State : BOOL


INITIALISATION
    lend := {} ||
    book := {} ||
	bookacq := {} ||
	bookDiscard := {} ||
    member := {} ||
	reservation := {} ||
	numReserv := {} ||
    precious := {} ||
	State := FALSE


OPERATIONS

    
    /***************/
    Acquire(book_, precious_) =
        PRE
            book_ : BOOKID &
            book_ /: book &
            book_ : bookacq &
            precious_ : BOOL    
        THEN
            book := book \/ {book_} ||
            bookacq := bookacq - {book_} ||
            precious(book_) := precious_
        END;

    
    /***************/
    AuthorizeAcq(book_) =
        PRE
            book_ : BOOKID &
            book_ /: bookacq &
            book_ /: book &
			State = TRUE
        THEN
            bookacq := bookacq \/ {book_}
        END;


    /***************/
    AuthorizeDiscard(book_) =
        PRE
            book_ : BOOKID &
            book_ : book &
            book_ /: dom(lend) &
            book_ /: bookDiscard &
			book_ /: dom(reservation)
        THEN
            bookDiscard := bookDiscard \/ {book_} 
        END;

    
    /***************/
	CancelAcq(book_) =
        PRE
            book_ : BOOKID &
            book_ : bookacq
        THEN
            bookacq := bookacq - {book_} 
        END;


    /***************/
	CancelDiscard(book_) =
        PRE
            book_ : BOOKID &
            book_ : bookDiscard
        THEN
            bookDiscard := bookDiscard - {book_} 
        END;


    /***************/
    CancelReserve(member_, book_) =
        PRE
            member_ : member &
            book_ : book &
            reservation /= {} &
			book_ |-> member_ : reservation
        THEN
			numReserv := {book_ |-> member_} <<| numReserv ||
            reservation := reservation - {book_ |-> member_}
        END;

    
    /***************/  
	Consult = 
        PRE
			State = TRUE &
			member /= {} 
        THEN
			skip
        END;

    
    /***************/
    Discard(book_) =
        PRE
            book_ : book &
            book_ : bookDiscard
        THEN
            book := book - {book_} ||
            reservation := {book_} <<| reservation ||
			precious := {book_} <<| precious ||
            bookDiscard := bookDiscard - {book_}
        END;

    
    /***************/
    Join(member_) =
        PRE
            member_ : MEMBERID &
            member_ /: member &
			State = TRUE
        THEN
            member := member \/ {member_}            
        END;

    
    /***************/
    Leave(member_) =
        PRE
            member_ : member &
            member_ /: ran(lend) &
			member_ /: ran(reservation)
        THEN
            member := member - {member_}
        END;
    
    
    /***************/
    Lend(member_, book_) =
        PRE
            member_ : member &
            book_ : book &
            book_ /: dom(lend) &
			book_ /: bookDiscard &
            card(ran(reservation)) <= 0 &
            card(lend |> {member_}) < maxBooks
        THEN
            lend(book_) := member_
        END;
    
    
    /***************/
    Renew(member_, book_) =
        PRE
            member_ : member &
            book_ : book &
            (book_ |-> member_) : lend &
            book_ /: dom(reservation)
        THEN
            skip
        END;
    
    
    /***************/
    Reserve(member_, book_) =
        PRE
            member_ : member &
            book_ : book &
            book_ : dom(lend) &
			book_ /: bookDiscard &
            member_ /: ran(lend) &
            book_ |-> member_ /: reservation
        THEN
            reservation := reservation \/ {book_ |-> member_} ||
            numReserv := numReserv \/ {(book_, member_) |-> (max(ran(numReserv) \/ {0}) + 1)}
        END;
    
    
    /***************/
    Return(member_, book_) =
        PRE
            member_ : member &
            book_ : book &
            (book_ |-> member_) : lend
        THEN
            lend := lend - {book_ |-> member_}
        END;


	/***************/
	SystemOFF =
		PRE
			member = {} &
			book = {} &
			State = TRUE
		THEN
			State := FALSE
		END;


	/***************/
	SystemON =
		PRE
			member = {} &
			book = {} &
			State = FALSE
		THEN
    		State := TRUE
		END;

    
    /***************/
    Take(member_, book_) =
        PRE
            member_ : member &
            book_ : book &
            book_ /: dom(lend) &
			book_ /: bookDiscard &
            card(lend |> {member_}) < maxBooks &
            !bk . ( bk:book => (reservation /= {}) => member_ : ran(reservation)) &
			!bk . ( bk:book => (numReserv /= {} => numReserv(book_, member_) = min(numReserv[{book_} <| dom(numReserv)])))
        THEN
            lend(book_) := member_ ||
			numReserv := {book_ |-> member_} <<| numReserv ||
            reservation := reservation - {book_ |-> member_}
        END
END

