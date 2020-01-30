MACHINE           Registrar

EXTENDS           Marriage

INCLUDES          Life

PROMOTES          born

OPERATIONS

  dies(nn) =
  PRE nn: PERSON & nn : male \/ female
  THEN
    die(nn) ||
    IF nn : dom(marriage)
    THEN part(nn,marriage(nn))
    ELSIF nn : ran(marriage)
    THEN part(marriage~(nn),nn)
    END
  END

END

