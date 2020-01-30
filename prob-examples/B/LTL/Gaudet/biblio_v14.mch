MACHINE biblio_v12
    
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
    MEMBERID = {m1,m2}; /*Members of the library*/
    BOOKID = {b1,b2};   /*Books of the library*/
	/*MEMBERID = {m1};*/
	/*BOOKID = {b1};*/
	BOOKSTATE = {available, borrowed}
   
CONSTANTS 
    maxBooks  /*Maximum of books a member can borrow*/

PROPERTIES 
    maxBooks : NATURAL & maxBooks = 2

DEFINITIONS
	/*1*/
	/*2*/
	ASSERT_LTL2 == "G( ( {b1 /: book} => not(e(Discard(b1))) ) )";
	/*3*/
	ASSERT_LTL3 == "G( {b1 /: book} => {b1 /: dom(reservation)} or {b1 /: dom(lend)} ) or not(F({b1 /: book} & ({b1 /: dom(reservation)} or {b1 /: dom(lend)})))";
	/*4*/
	ASSERT_LTL4 == "G( e(Lend(m1,b1)) => {m1 : member} )";
	/*5*/
	ASSERT_LTL5 == "G( e(Reserve(m1,b1)) => ({b1 : dom(lend)} or ({b1 |-> m1 /: reservation} or {b1 |-> m1 /: lend}) ) )";
	/*6*/
	ASSERT_LTL6 == "G( e(Reserve(m1,b1)) => not({b1 |-> m1 : lend}) )";
	/*7*/
	ASSERT_LTL7 == "G( e(Reserve(m1,b1)) => not({b1 |-> m1 : reservation}))";
	/*8*/
	ASSERT_LTL8 == "G( {b1 : dom(reservation)} => not(e(Lend(m1,b1))) )";
	/*9*/
	ASSERT_LTL9 == "G( {b1 : dom(reservation)} => not(e(Renew(m1,b1))) )";
	/*10*/
	/*ASSERT_LTL10 == "G( e(Take(m1,b1)) => {numReserv(b1,m1) = min(numReserv[{b1} <| dom(numReserv)])} )";*/
	/*11*/
	ASSERT_LTL11 == "G( {b1 |-> m2 : lend} => not(e(Take(m1,b1))) W {b1 |-> m2 /: lend} )";
	/*12*/
	/*13*/
	ASSERT_LTL13 == "G( e(Leave(m1)) => {m1 : member} & {m1 /: ran(lend)} & {m1 /: ran(reservation)} )";
	/*14*/
	/*15*/
	/*16*/
	/*17*/
	/*18*/
	ASSERT_LTL18 == "G( {!xm.( xm:member => card(lend |> {xm}) <= maxBooks )} )"

VARIABLES
    lend,
    member,
    book,
	reservation,    /*Contains a list of reservation for a book*/
	numReserv,      /*Contains a number to sequence the members in the list of reservation*/
	bookStatus
    
    
INVARIANT
    member <: MEMBERID & 
    book <: BOOKID &
	lend : book +-> member &
    !xm.( xm:member => card(lend |> {xm}) <= maxBooks ) &  /*A member can't borrow more than the maxBooks of the system*/

	reservation : book <-> member &
	numReserv : reservation --> INTEGER &
    bookStatus : BOOKID +-> BOOKSTATE &
    
    !bb . (bb : BOOKID & bb : book => (
            	(bookStatus(bb) = available => bb : book & bb /: dom(lend))
        	&
        		(bookStatus(bb) = borrowed => bb : book & bb : dom(lend))
        	)
     	) 
     &
     !bb2 . (bb2 : BOOKID => (
             bookStatus(bb2) = borrowed =>  bb2 : dom(lend)
         	)
         )
     

INITIALISATION
    lend := {} ||
    book := {} ||
	member := {} ||
	reservation := {} ||
	numReserv := {} ||
	bookStatus := BOOKID * {available}
	

OPERATIONS

    
    /***************/
    Acquire(book_) =
        PRE
            book_ : BOOKID &
            book_ /: book 
        THEN
            book := book \/ {book_}
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
    Discard(book_) =
        PRE
            book_ : book &
            book_ /: dom(lend) &
            book_ /: dom(reservation)
        THEN
            book := book - {book_} ||
            reservation := {book_} <<| reservation 
        END;

    
    /***************/
    Join(member_) =
        PRE
            member_ : MEMBERID &
            member_ /: member 
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
            card(ran(reservation)) <= 0 &
            card(lend |> {member_}) < maxBooks &
			bookStatus(book_) = available
        THEN
            lend(book_) := member_ ||
            bookStatus(book_) := borrowed
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
            (book_ |-> member_) : lend &
			bookStatus(book_) = borrowed
        THEN
            lend := lend - {book_ |-> member_} ||
			bookStatus(book_) := available
        END;

    
    /***************/
    Take(member_, book_) =
        PRE
            member_ : member &
            book_ : book &
            book_ /: dom(lend) &
            card(lend |> {member_}) < maxBooks &
            book_ |-> member_ : reservation &
            bookStatus(book_) = available &
            numReserv(book_, member_) = min(numReserv[{book_} <| dom(numReserv)])
        THEN
            lend(book_) := member_ ||
			numReserv := {book_ |-> member_} <<| numReserv ||
			reservation := reservation - {book_ |-> member_} ||
			bookStatus(book_) := borrowed
        END
END

