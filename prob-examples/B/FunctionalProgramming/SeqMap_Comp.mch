MACHINE SeqMap_Comp
CONSTANTS square
PROPERTIES
    square: NATURAL<->NATURAL &
    square = {ii,jj | ii:NATURAL & jj:NATURAL & jj=ii*ii}
VARIABLES ss
INVARIANT ss: seq(NATURAL)
INITIALISATION ss  := <>
OPERATIONS
   Add(nn)    = PRE nn:NATURAL  THEN ss := ss <- nn END;
   Square = BEGIN ss := (ss ; square) END
END

