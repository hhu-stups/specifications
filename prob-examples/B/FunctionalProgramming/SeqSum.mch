MACHINE SeqSum
ABSTRACT_CONSTANTS seqsum
PROPERTIES
   seqsum : POW(INTEGER*INTEGER)<->INTEGER &
   seqsum = 
    { ii,zz | ii:seq(NATURAL) & zz: NATURAL &
           (ii=<>  => zz=0) &
           (size(ii)>0 =>  zz = first(ii) + seqsum(tail(ii)) )
    }
ASSERTIONS
  seqsum : seq(NATURAL)-->NATURAL
VARIABLES ss
INVARIANT ss: seq(NATURAL)
INITIALISATION ss  := <>
OPERATIONS
   Add(nn)    = PRE nn:NATURAL  THEN ss := ss <- nn END;
   cc <-- Sum = BEGIN cc := seqsum(ss) END
END

