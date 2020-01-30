MACHINE           Registrar

INCLUDES          BirthandDeath

PROMOTES          born

EXTENDS           Marriage

OPERATIONS

  death(nn) =
  PRE
    nn : male \/ female
  THEN
    IF nn : dom(married)
    THEN divorce(nn,married(nn))
    ELSIF nn : ran(married)
    THEN divorce(married~(nn),nn)
    END
  ||
    dies(nn)
  END 

END
