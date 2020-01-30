MACHINE count
CONSTANTS
  Range
PROPERTIES
  Range = 0..10
VARIABLES
  yy
INVARIANT
  yy : Range
INITIALISATION
  yy := 0
OPERATIONS
  mm <-- in = mm::Range;

  put(xx) =
    PRE xx : Range THEN
      yy := yy + xx
    END;

  set_up(xx) =
    PRE xx : Range THEN
      yy := xx
    END;

  update(xx) =
    PRE xx : Range & xx = yy THEN
      skip
    END
END
