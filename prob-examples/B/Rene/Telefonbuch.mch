MACHINE Telefonbuch
SETS
 Persons={p1,p2}
VARIABLES book, count
INVARIANT
 book : Persons +-> NAT1 &
 count : NAT &
 count = card(book)
INITIALISATION book,count := {}, 0

OPERATIONS
  n <-- getEntry = BEGIN
    n:=count
  END;

  addEntry(p,n) =
    PRE
	  p /: dom(book) &
	  n /: ran(book)
    THEN
	  book := book \/ {p|->n} || count := count + 1
  END
END