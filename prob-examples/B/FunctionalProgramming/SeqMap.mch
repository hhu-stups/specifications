MACHINE SeqMap
ABSTRACT_CONSTANTS map, square
PROPERTIES
    map : ((INTEGER<->INTEGER)*POW(INTEGER*INTEGER))<->POW(INTEGER*INTEGER) &
    map = 
    { ff,ii,zz | ii:seq(NATURAL) & zz: seq(NATURAL) & ff:NATURAL<->NATURAL &
           (ii=<>  => zz=<>) &
           (size(ii)>0 =>  zz =  ff(first(ii)) -> map(ff,tail(ii)) )
    } &
    square: INTEGER<->INTEGER &
    square = {ii,jj | ii:NATURAL & jj:NATURAL & jj=ii*ii}
ASSERTIONS
       map : ((NATURAL<->NATURAL)*seq(NATURAL))-->seq(NATURAL);
       square: NATURAL-->NATURAL
VARIABLES ss
INVARIANT ss: seq(NATURAL)
INITIALISATION ss  := <>
OPERATIONS
   Add(nn)    = PRE nn:NATURAL  THEN ss := ss <- nn END;
   Square = BEGIN ss := map(square,ss) END;
   r <-- Get = BEGIN r:= ss END
END

