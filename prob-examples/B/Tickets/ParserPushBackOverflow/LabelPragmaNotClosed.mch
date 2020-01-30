MACHINE LabelPragmaNotClosed
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
 & /*@label "TO DO: (the reported min-safe-rear-end of this train is within the distance that can be covered at the reported speed within the shadow train timer A from the TTD limit) */
     vss /= "not_yet_implemented"
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set1(yy) = PRE yy:ID THEN xx:= yy END;
  Set2(yy) = PRE yy:ID THEN xx:= yy END;
  Set3(yy) = PRE yy:ID THEN xx:= yy END
END



END
/*

! An error occurred !
! source(parse_error)
! Pushback buffer overflow
! none

*/
