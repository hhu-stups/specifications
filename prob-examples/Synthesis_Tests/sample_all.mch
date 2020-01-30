
MACHINE sample_lift
ABSTRACT_VARIABLES
  b_1 , int_1, int_2, set_1, set_2, set_3, set_4, set_5, seq_1, seq_2
INVARIANT
    b_1 : BOOL & 
    int_1 : INTEGER &
    int_2 : INTEGER &
    set_1 : POW(INTEGER) & 
    set_2 : POW(INTEGER) & 
    set_3 : POW(INTEGER) & 
    set_4 : POW(POW(INTEGER)) & 
    set_5 : POW(INTEGER*INTEGER) & 
    seq_1 : seq(INTEGER) & 
    seq_2 : seq(INTEGER)
INITIALISATION
    BEGIN
         b_1 := TRUE || int_1 := 0 || int_2 := 0 || set_1 := {} || set_2 := {} || set_3 := {} || set_4 := {} || set_5 := {} || seq_1 := {} || seq_2 := {}
    END
OPERATIONS
    empty = BEGIN skip END
END
