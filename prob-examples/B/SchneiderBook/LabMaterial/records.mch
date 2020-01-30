MACHINE           Records

SETS              PERSON; SEX = {girl, boy}

VARIABLES         male, female, married

INVARIANT         male <: PERSON & female <: PERSON & male /\ female = {}
                  & married : male >+> female

INITIALISATION    male := {} || female := {} || married := {}

OPERATIONS

born(nn,ss) =
  PRE nn : PERSON & ss : SEX
  THEN 
    IF ss = boy
    THEN male := male \/ {nn}
    ELSE female := female \/ {nn}
    END
  END;

dies(nn) =
  PRE nn : PERSON
  THEN
    IF nn : male
    THEN male := male - {nn}
    ELSE female := female - {nn}
    END
  END;

marries(nn,mm) =
  PRE nn : male & mm : female
  THEN married := married \/ {nn |-> mm}
  END;

divorces (nn, mm) =
  PRE nn : male & mm : female & nn|->mm : married
  THEN married := married - {nn|->mm}
  END;

sexchange(nn) =
  PRE nn : male \/ female
  THEN 
    IF nn : male
    THEN male := male - {nn} || female := female \/ {nn}
    ELSE female := female - {nn} || male := male \/ {nn}
    END
  END

END
