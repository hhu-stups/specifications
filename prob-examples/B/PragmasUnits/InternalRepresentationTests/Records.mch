MACHINE Records
VARIABLES
  xx,
  /*@ unit "m" */ my_int
INVARIANT
 my_int : INT &
 xx : struct(an_int : INT, another_int : INT)
INITIALISATION xx:= rec(an_int:5, another_int:2) || my_int := 17
OPERATIONS
  positive = PRE xx'an_int > 0 THEN skip END;
  set_value = BEGIN my_int := xx'another_int END
END

