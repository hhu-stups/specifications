MACHINE           School

SETS              BOOK; CHILD

VARIABLES         hasread

INVARIANT         hasread : CHILD <-> BOOK

INITIALISATION    hasread := {}

OPERATIONS

  record(cc,bb) =
  PRE
    cc : CHILD & bb : BOOK
  THEN
    hasread := hasread \/ {cc |-> bb}
  END;

bb <-- newbook(cc) =
  PRE
    cc : CHILD & hasread[{cc}] /= BOOK
  THEN
    bb :: ran({cc}<<|hasread)
  END;

nn <-- booksquery(cc) =
  PRE
    cc : CHILD
  THEN
    nn := card(hasread[{cc}])
  END

END
