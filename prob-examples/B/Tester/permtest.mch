MACHINE permtest
SETS
   BOOKS = {b1,b2}
VARIABLES
   ff
INVARIANT
   ff : seq(BOOKS)
INITIALISATION
   ff := <>
OPERATIONS
   add(bb) = PRE bb: BOOKS THEN ff := [bb]^ff END;
   is_perm = PRE ff: perm(BOOKS) THEN skip END;
   set_perm = BEGIN ff :: perm(BOOKS) END;
   set_seq = BEGIN ff :: seq(BOOKS) END;
   set_iseq = BEGIN ff :: iseq(BOOKS) END;
   rr <-- get_book = BEGIN rr :: BOOKS END;
   rr <-- get_books = BEGIN rr :: (BOOKS --> BOOKS) END
END