MACHINE SeqSquare
DEFINITIONS
  GOAL == size(ss)>2
CONSTANTS seqsq
PROPERTIES
   seqsq : seq(NATURAL)<->seq(NATURAL) &
   seqsq = 
    { ii,zz | ii:seq(NATURAL) & zz: seq(NATURAL) &
           (ii=<>  => zz=<>) &
           (size(ii)>0 =>  zz = first(ii)*first(ii) -> seqsq(tail(ii)) )
    }

VARIABLES ss
INVARIANT ss: seq(NATURAL)
INITIALISATION ss  := <>
OPERATIONS
   Add(nn)    = PRE nn:NATURAL  THEN ss := ss <- nn END;
   Square = BEGIN ss := seqsq(ss) END
END

