MACHINE Phonebook
SETS
 Persons={p1,p2}
VARIABLES book, count
INVARIANT
 book : Persons <-> NAT1 &
 count : NAT &
 count = card(book)
INITIALISATION book,count := {}, 0

OPERATIONS
  n <-- getEntry = BEGIN
    n:=count
  END;

  addEntry(p,n) =
    PRE
	  n : NAT1 &
	  p : Persons &
	  p /: dom(book) &
	  n /: ran(book)
    THEN
	  book := book \/ {p|->n} || count := count + 1
  END;

  remEntry(p,n) =
    PRE
	  n : ran(book) &
	  p : dom(book) &
	  book[{p}] = {n}
    THEN
	  book := book - {p|->n} || count := count - 1
  END
END