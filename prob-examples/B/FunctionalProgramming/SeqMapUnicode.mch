MACHINE SeqMapUnicode
ABSTRACT_CONSTANTS map, square
PROPERTIES
    map ∈ ((INTEGER↔INTEGER)×ℙ(INTEGER×ℤ))↔POW(INTEGER×ℤ) ∧
    map = 
    { ff,ii,zz | ii∈seq(ℕ) ∧ zz∈seq(ℕ) ∧ ff∈ ℕ ↔ ℕ ∧
           (ii=<>  ⇒ zz=<>) ∧
           (size(ii)>0 ⇒  zz =  ff(first(ii)) -> map(ff,tail(ii)) )
    } ∧
    square∈ INTEGER↔INTEGER ∧
    square = {ii,jj | ii∈ ℕ ∧ jj∈ ℕ ∧ jj=ii*ii}
ASSERTIONS
       map ∈ ((NATURAL↔NATURAL)×seq(ℕ))→seq(ℕ);
       square∈ NATURAL→NATURAL
VARIABLES ss
INVARIANT ss∈ seq(ℕ)
INITIALISATION ss  := <>
OPERATIONS
   Add(nn)    = PRE nn∈NATURAL  THEN ss := ss <- nn END;
   Square = BEGIN ss := map(square,ss) END;
   r <-- Get = BEGIN r:= ss END
END





