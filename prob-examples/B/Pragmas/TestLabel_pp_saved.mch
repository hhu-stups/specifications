
MACHINE TestLabel_pp
SETS /* enumerated */
  ID={aa,bb}
ABSTRACT_VARIABLES
  xx
INVARIANT
    xx : ID
ASSERTIONS
     /* @"axm1" */ aa /= bb
   ; /* @"axm2" */
     !xx.(
      xx : ID
      =>
      (
       xx /= bb
       or
       xx /= aa
      )
     )
   ; /* @axm3 */
     !xx.(
      xx : ID
      =>
      (
       xx /= aa
       or
       xx /= bb
      )
     )
   ; /* @axm4 */ xx /= aa
   ; /* @axm5 */ bb /= aa
INITIALISATION
    BEGIN
      xx := aa
    END
OPERATIONS
  Set(yy) =
    PRE
        yy : ID
    THEN
      xx := yy
    END
END
