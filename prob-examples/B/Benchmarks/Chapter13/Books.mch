MACHINE           Books(BOOK)

VARIABLES         read

INVARIANT         read <: BOOK

INITIALISATION    read := {}

OPERATIONS

bb <-- newbook =
  PRE read /= BOOK
  THEN ANY tt 
       WHERE tt : BOOK - read 
       THEN bb := tt || read := read \/ {tt}
       END
  END

END
