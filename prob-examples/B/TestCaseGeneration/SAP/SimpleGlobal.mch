MACHINE SimpleGlobal
DEFINITIONS
  FINAL == (state=6 or state=8);
  GOAL == FINAL
VARIABLES state
INVARIANT
 state : 1..8
INITIALISATION state:=1
OPERATIONS
   Aa1 = PRE state=1 THEN
    state := 2
   END;
   Ab1 = PRE state=1 THEN
    state := 3
   END;
   Ab2 = PRE state=2 THEN
    state := 4
   END;
   Bc1 = PRE state=3 THEN
    state := 5
   END;
   Bc2 = PRE state=4 THEN
    state := 6
   END;
   Aa2 = PRE state=5 THEN
    state := 6
   END;
   Ad1 = PRE state=5 THEN
    state := 7
   END;
   Bf1 = PRE state=6 THEN
    state := 4
   END;
   Ad2 = PRE state=6 THEN
    state := 8
   END;
   Aa3 = PRE state=7 THEN
    state := 8
   END;
   Bf2 = PRE state=8 THEN
    state := 4
   END
END