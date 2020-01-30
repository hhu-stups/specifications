MACHINE LargeExplicitSet
VARIABLES xx
INVARIANT
 xx<:INTEGER
INITIALISATION xx:={1}
OPERATIONS
  IncSet = xx := xx \/ (2+card(xx)..(2+5*card(xx)))
END

