MACHINE FunOverrideTest
ABSTRACT_VARIABLES
  f,
  init
INVARIANT
    f: INTEGER <-> INTEGER
  &  dom(f) = {1}
  & (/* @FunOverrideTest:inv3 */ init = TRUE => card(f) = 1)
INITIALISATION
         f := {(1|->1),(1|->2),(1|->3)}
      ||
         init := FALSE
OPERATIONS
  assign = 
    BEGIN 
         f := f <+ {1 |-> 0}
      ||
         init := TRUE
    END;
  assign2 = 
    BEGIN 
         f(1) := 0
      ||
         init := TRUE
    END
END

