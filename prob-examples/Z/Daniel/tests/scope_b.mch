MACHINE limit

DEFINITIONS
  SCOPE == (size(s)<6)

SETS
  Token = {t}

VARIABLES
  s

INVARIANT
  s : seq(Token)

INITIALISATION
  s := []

OPERATIONS
  append = s := s ^ [t]

END