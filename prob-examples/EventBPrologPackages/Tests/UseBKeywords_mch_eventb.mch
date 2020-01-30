
MACHINE UseBKeywords_mch_eventb
ABSTRACT_VARIABLES
  BEGIN__,
  END__,
  MACHINE__,
  PI__,
  SIGMA__,
  WHILE__,
  first__
/* PROMOTED OPERATIONS
  inc,
  reset */
INVARIANT
    MACHINE__ : POW(BOOL)
  & first__ : INTEGER
  & /* @UseBKeywords:inv2  */ SIGMA__ : NATURAL
  & /* @UseBKeywords:inv3  */ PI__ : NATURAL1
  & /* @UseBKeywords:inv4  */ END__ : NATURAL
  & /* @UseBKeywords:inv5  */ BEGIN__ : NATURAL1
  & /* @UseBKeywords:inv6  */ WHILE__ : NATURAL1
INITIALISATION
    BEGIN
         first__ := 1
      ||
         SIGMA__ := 1
      ||
         PI__ := 1
      ||
         END__ := 7
      ||
         BEGIN__ := 1
      ||
         WHILE__ := 77
      ||
         MACHINE__ := {}
    END
OPERATIONS
  inc = 
    SELECT 
        /* @UseBKeywords:grd1  */ SIGMA__ < END__
    THEN 
         SIGMA__ := SIGMA__ + 1
      ||
         PI__ := PI__ * SIGMA__
    END;
  
  reset = 
    BEGIN
         SIGMA__ := BEGIN__
      ||
         PI__ := BEGIN__
    END
END
