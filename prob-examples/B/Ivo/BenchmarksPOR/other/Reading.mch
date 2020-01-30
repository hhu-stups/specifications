MACHINE           Reading
/* This B Machine is taken from the book: The B-Method: An Introduction
   (Editor Palgrave, ISBN 0-33-79284-X, Year 2002) by Steve Schneider.
   This machine is distributed with kind permission by Steve Schneider.
*/
SETS              READER; BOOK; COPY; RESPONSE = {yes, no}

CONSTANTS         copyof

PROPERTIES        copyof : COPY -->> BOOK

VARIABLES         hasread, reading

INVARIANT         hasread : READER <-> BOOK & reading : READER >+> COPY & (reading ; copyof) /\ hasread = {}

INITIALISATION    hasread := {} || reading := {}

OPERATIONS

start(rr,cc) =
  PRE rr : READER & cc : COPY & copyof(cc) /: hasread[{rr}]
      & rr /: dom(reading) & cc /: ran(reading)
  THEN reading := reading \/ {rr |-> cc}
  END;

finished(rr,cc) =
  PRE rr : READER & cc : COPY & cc = reading(rr)
  THEN hasread := hasread \/ {rr |-> copyof(cc)}
       || reading := {rr} <<| reading
  END;

resp <-- precurrentquery(rr) =
  PRE rr : READER
  THEN
    IF rr : dom(reading)
    THEN resp := yes
    ELSE resp := no
    END
  END;

bb <-- currentquery(rr) =
  PRE rr : READER & rr : dom(reading)
  THEN bb := copyof(reading(rr))
  END;

resp <-- hasreadquery(rr,bb) =
  PRE rr : READER & bb : BOOK
  THEN
    IF bb : hasread[{rr}]
    THEN resp := yes
    ELSE resp := no
    END
  END

END
