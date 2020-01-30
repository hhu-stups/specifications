MACHINE sum
CONSTANTS
  Index, Range
PROPERTIES
  Index = 1..3 &
  Range = 0..2
VARIABLES
  aa
INVARIANT
  aa : seq(Range) & size(aa) = 3
INITIALISATION
  aa : (aa : seq(Range) & size(aa) = 3)
OPERATIONS
  asign(xx) =
   PRE xx : seq(Range) & size(xx) = 3 THEN
     aa := xx
   END;

  ss <-- in =
   ANY xx WHERE
    xx : seq(Range) &
    size(xx) = 3
   THEN
    ss := xx
   END
END
