
MACHINE Records_internal
ABSTRACT_VARIABLES
  /*@ inferred_unit "rec([field(an_int,unknown),field(another_int,m)])" */ xx,
  /*@ unit "m" */ my_int
INVARIANT
    my_int : INT
  & xx : struct(an_int:INT,another_int:INT)
INITIALISATION
    BEGIN
         xx := rec(an_int:5,another_int:2)
      ||
         my_int := 17
    END
OPERATIONS
  positive =
    PRE
        xx'an_int > 0
    THEN
      skip
    END;

  set_value =
    BEGIN
      my_int := xx'another_int
    END
END
