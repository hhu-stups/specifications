MACHINE Test
CONSTANTS ss,ss2
PROPERTIES
 ss=1..81 & ss2=(1..3)*(1..3)*(1..3)*(1..3)
VARIABLES
  table
INVARIANT table<:ss2
INITIALISATION table := ss2
OPERATIONS
  isel(yy) = PRE yy:ss2 THEN table := table-{yy} END
END

