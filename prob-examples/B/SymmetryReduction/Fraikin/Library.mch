MACHINE Library

    /*
    Specification of a library system
    University of Sherbrooke
    First version
    Eric Gaudet: July 21, 2009
    Modified by
    Marc Frappier and Benoit Fraikin: May 06, 2010
    Benoit Fraikin: May 28, 2010
    */

SETS
    MEMBERID = {m1,m2,m3} ;
    BOOKID = {b1,b2,b3}

CONCRETE_CONSTANTS
    /* Maximum of books a member can borrow */
    maxNbLoans

DEFINITIONS
    FORCE_SYMMETRY_MEMBERID == TRUE; FORCE_SYMMETRY_BOOKID == TRUE;
    BOOK_IS_NOT_RESERVED == reservation(book_) = [] ;
    BOOK_IS_RESERVED == reservation(book_) /= [] ;
    MEMBER_HAS_NO_RESERVATION == union(ran(reservation)) |> {member_} = {} ;
    Indice (bb1,mm1) == (reservation(bb1)~)(mm1) ;
    /* 1 - A book can be acquired by the library if it is not currently acquired. */
    /*ASSERT_LTL_1 == "G( {b1 /: book} => e(Acquire(b1)) )" ; */
    /* 2 - A book can be acquired by the library only if it is not currently acquired. */
    ASSERT_LTL_2 == "G( e(Acquire(b1)) => {b1 /: book})" ;
    /* 3 - An acquired book can be discarded, but only if it has not been lent or reserved. */
    ASSERT_LTL_3 == "G( {b1 : book} => ( e(Discard(b1)) => ({b1 /: dom(loan)} & {b1:dom(reservation) & reservation(b1) = []}) ) )" ;
    /* 4 - A person must be a member of the library in order to borrow a book. */
    ASSERT_LTL_4 == "G( e(Lend(m1,b1)) => {m1 : member} )" ;
    /* 5 - A book can be reserved only if it has been lent or already reserved by another member. */
    ASSERT_LTL_5 == "G( e(Reserve(m1,b1)) => ( {m1 /: ran(reservation(b1))} & {b1|->m1 /: loan} & {b1:dom(loan)} or {b1:dom(reservation) & reservation(b1) = []} ) )" ;
    /* 6 - A book cannot be reserved by the member who is borrowing it. */
    ASSERT_LTL_6 == "G( e(Reserve(m1,b1)) => not({b1 |-> m1 : loan}) )" ;
    /* 7 - A book cannot be reserved by the member who is reserving it. */
    ASSERT_LTL_7 == "G( e(Reserve(m1,b1)) => not({m1 : ran(reservation(b1))}) )" ;
    /* 8 - A book cannot be lent to a member if it is reserved. */
    ASSERT_LTL_8 == "G( {b1 : dom(reservation)} => not(e(Lend(m1,b1))) )" ;
    /* 9 - A member cannot renew a loan if the book is reserved. */
    ASSERT_LTL_9 == "G( {b1 : dom(reservation)} => not(e(Renew(m1,b1))) )" ;
    /* 10 - A member is allowed to take it only if he is the one who made the oldest reservation. */
    ASSERT_LTL_10 == "G( e(Take(m1,b1)) => {b1:dom(reservation) & reservation(b1) /= [] & first(reservation(b1)) = m1} )" ;
    /* 11 - A book can be taken only after it is returned */
    ASSERT_LTL_11 == "G( {b1 |-> m2 : loan} => not(e(Take(m1,b1))) W {b1 |-> m2 /: loan} )" ;
    /* 12 - Anyone who has reserved a book can cancel the reservation at anytime before the reservation has been used, i.e. when the member takes it. */
    /*ASSERT_LTL_12 == "G( {m1 : ran(reservation(b1))} => (e(Cancel(m1,b1)) W [Take(m1,b1)]) )" ;*/ /* verifier qu'il ne faut pas un release */
    /* 13 - A member can relinquish library membership only when all his loans have been returned and all his reservations have either been used or canceled */
    ASSERT_LTL_13 == "G( e(Leave(m1)) => {m1 : member} & {m1 /: ran(loan)} & {union(ran(reservation)) |> {m1} = {}} )" ;
    /* 14 - Ultimately, a member can leave the library.  */
    /* ASSERT_LTL_14 == "{1=1}" ; */
    /* 15 - A member cannot borrow more than the loan limit deﬁned at the system level for all users. */
    /* ASSERT_LTL_15 == "G( {!xm.( xm:member => card(loan |> {xm}) <= maxNbLoans )} )" */ /* INVARIANT */

PROPERTIES
    maxNbLoans = 2

ABSTRACT_VARIABLES
    loan ,
    member ,
    book ,
    reservation

INVARIANT
    member <: MEMBERID &
    book <: BOOKID &
    loan : book +-> member &
    /*A member can't borrow more than the maxNbLoans of the system*/
    ! mm . ( mm : member => card ( loan |> { mm } ) <= maxNbLoans ) &
    reservation : book --> iseq(member)
INITIALISATION
    loan := {} ||
    book := {} ||
    member := {} ||
    reservation := {}

OPERATIONS

    Acquire ( book_ ) =
    PRE
        book_ : BOOKID &
        book_ /: book
    THEN
        book := book \/ { book_ } ||
        reservation(book_) := []
    END ;

    Cancel ( member_ , book_ ) =
    PRE
        member_ : MEMBERID &
        member_ : member &
        book_ : BOOKID &
        book_ : book &
        book_ : dom(reservation) &
        member_ : ran(reservation(book_))
    THEN
        reservation(book_) :=
            (reservation(book_) /|\ (Indice(book_, member_) - 1))
            ^
            (reservation (book_) \|/ Indice(book_, member_))
    END ;

    Discard ( book_ ) =
    PRE
        book_ : BOOKID &
        book_ : book &
        book_ /: dom ( loan ) &
        BOOK_IS_NOT_RESERVED
    THEN
        book := book - { book_ } ||
        reservation := {book_} <<| reservation
    END ;

    Join ( member_ ) =
    PRE
        member_ : MEMBERID &
        member_ /: member
    THEN
        member := member \/ { member_ }
    END ;

    Leave ( member_ ) =
    PRE
        member_ : MEMBERID &
        member_ : member &
        member_ /: ran(loan) &
        MEMBER_HAS_NO_RESERVATION
    THEN
        member := member - { member_ }
    END ;

    Lend ( member_ , book_ ) =
    PRE
        member_ : MEMBERID &
        member_ : member &
        book_ : BOOKID &
        book_ : book &
        book_ /: dom ( loan ) &
        BOOK_IS_NOT_RESERVED &
        card ( loan |> { member_ } ) < maxNbLoans
    THEN
        loan ( book_ ) := member_
    END ;

    Renew ( member_ , book_ ) =
    PRE
        member_ : MEMBERID &
        book_ : BOOKID &
        member_ : member &
        book_ : book &
        ( book_ |-> member_ ) : loan &
        BOOK_IS_NOT_RESERVED
    THEN
        skip
    END ;

    Reserve ( member_ , book_ ) =
    PRE
        member_ : MEMBERID &
        book_ : BOOKID &
        member_ : member &
        book_ : book &
        member_ /: ran(reservation(book_)) &
        book_ |-> member_ /: loan &
        (
            book_ : dom ( loan )
            or
            BOOK_IS_RESERVED
        )
    THEN
        reservation := reservation <+ { book_ |-> ((reservation(book_) <- member_)) }
    END ;

    Return ( book_ ) =
    PRE
        book_ : BOOKID &
        book_ : book &
        book_ : dom ( loan )
    THEN
        loan := { book_ } <<| loan
    END ;

    Take ( member_ , book_ ) =
    PRE
        member_ : MEMBERID &
        book_ : BOOKID &
        member_ : member &
        book_ : book &
        book_ /: dom ( loan ) &
        card ( loan |> { member_ } ) < maxNbLoans &
        size(reservation(book_)) /= 0 &
        first(reservation(book_)) = member_
    THEN
        loan ( book_ ) := member_ ||
        reservation := reservation <+ { book_ |-> tail(reservation(book_)) }
    END

END

