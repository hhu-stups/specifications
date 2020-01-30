MACHINE SimpleInvViolation
SETS
 ID={aa,bb}
CONSTANTS n
PROPERTIES
 n:10..100
VARIABLES reserve
INVARIANT
 reserve : ID --> 0..n
INITIALISATION reserve:= ID * {0}
OPERATIONS
  AddReservation(idx) = PRE idx:ID THEN reserve(idx) := reserve(idx)+1 END /* ;
  DelReservations(idx) = PRE idx:ID & reserve(idx)>0 THEN reserve(idx) := 0 END */
END

