MACHINE           Set(ELEM)

VARIABLES         set

INVARIANT         set <: ELEM

INITIALISATION    set := {}

OPERATIONS

  add(ee) =
  PRE ee : ELEM THEN set := set \/ {ee} END;

oo <-- out =
  PRE set /= {}
  THEN ANY ee 
       WHERE ee : set
       THEN oo := ee || set := set - {ee}
       END
  END

END
