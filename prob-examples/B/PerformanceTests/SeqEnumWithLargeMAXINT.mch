MACHINE SeqEnumWithLargeMAXINT
/* test whether sequence enumeration works with large MAXINT values */
/* (previous versions of ProB generated all indexes in a list first) */
DEFINITIONS
   SET_PREF_MAXINT == 2147483647;
   SET_PREF_MININT == -2147483647;
SETS
 ID={aa,bb}
CONSTANTS myseq
PROPERTIES
 myseq : seq(ID) &
 card(myseq) = 2
OPERATIONS
  xx <-- Get(yy) = PRE yy:dom(myseq) THEN xx:= myseq(yy) END
END

