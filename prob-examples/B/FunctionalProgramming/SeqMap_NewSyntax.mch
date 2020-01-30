MACHINE SeqMap_NewSyntax
ABSTRACT_CONSTANTS map, square
PROPERTIES
    map : ((INTEGER<->INTEGER)*POW(INTEGER*INTEGER))<->POW(INTEGER*INTEGER) &
    map = 
    %(ff,ii).(ii:seq(NATURAL) & ff:NATURAL<->INTEGER |
           (IF ii=<>  THEN <>
            ELSE ff(first(ii)) -> map(ff,tail(ii))
            END))
    &
    square: NATURAL-->INTEGER &
    square = %ii.(ii:NATURAL|ii*ii)
ASSERTIONS
       map : ((NATURAL<->NATURAL)*seq(NATURAL))-->seq(NATURAL);
       square: NATURAL-->NATURAL
VARIABLES ss
INVARIANT ss: seq(NATURAL)
INITIALISATION ss  := <>
OPERATIONS
   Add(nn)    = PRE nn:NATURAL  THEN ss := ss <- nn END;
   Square = BEGIN ss := map(square,ss) END;
   SquareRelCompose = BEGIN ss := (ss ; square) END;
   r <-- Get = BEGIN r:= ss END
END

