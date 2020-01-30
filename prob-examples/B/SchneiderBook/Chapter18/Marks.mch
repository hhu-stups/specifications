MACHINE           Marks

VARIABLES         marks

INVARIANT         marks <: 0..100

INITIALISATION    marks := {}

OPERATIONS

  add(mm) =
  PRE mm : 0..100
  THEN marks := marks \/ {mm}
  END;

mm <-- maximum =
  PRE marks /= {}
  THEN mm := max(marks)
  END

END
