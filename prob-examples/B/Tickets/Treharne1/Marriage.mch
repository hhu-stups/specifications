MACHINE           Marriage

USES              BirthandDeath

VARIABLES         married

INVARIANT         married : male >+> female

INITIALISATION    married := {}

OPERATIONS

  wedding(mm,ff) =
  PRE
    mm : male & mm /: dom(married) &
    ff : female & ff /: ran(married)
  THEN 
    married(mm) := ff
  END;

  divorce(mm,ff) =
  PRE
    mm : male & ff : female & mm|->ff : married
  THEN
    married := married - {mm|->ff}
  END

END
