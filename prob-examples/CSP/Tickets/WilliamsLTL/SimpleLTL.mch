MACHINE SimpleLTL
/*
-- With "Start search in initialisation" check the following formula:
-- (GF e(a) => GF [a]) => F [c]
-- Initially the formula is false; after the counter example is found the same check yields formula true

B Translation of:
channel a,b,c
MAIN = a -> MAIN [] b -> c -> MAIN
*/
DEFINITIONS
  ASSERT_LTL == "(GF e(a) => GF [a]) => F [c]"
VARIABLES pc
INVARIANT
 pc:NATURAL
INITIALISATION pc := 0
OPERATIONS
  a = PRE pc<2 THEN pc := 1 END;
  b = PRE pc<2 THEN pc := 2 END;
  c = PRE pc=2 THEN pc := 1 END
END

