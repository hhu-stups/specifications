
MACHINE sample_lift
ABSTRACT_VARIABLES
  int_1, int_2, int_3, int_4, int_5, int_6
INVARIANT
    int_1 : INTEGER &
    int_2 : INTEGER &
    int_3 : INTEGER &
    int_4 : INTEGER &
    int_5 : INTEGER &
    int_6 : INTEGER
INITIALISATION
    BEGIN
         int_1 := 0 || int_2 := 0 || int_3 := 0 || int_4 := 0 || int_5 := 0 || int_6 := 0
    END
OPERATIONS
    empty = BEGIN skip END
END
