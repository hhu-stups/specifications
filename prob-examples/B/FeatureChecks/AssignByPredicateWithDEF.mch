MACHINE AssignByPredicateWithDEF
DEFINITIONS lt == xx<xx$0+10
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
  Inc = PRE xx<1000 THEN
    xx : (xx>xx$0 & lt)
  END;
  r <-- Get = BEGIN r:=xx END
END

/*
Used to raise error in parser:
! An error occurred !
! source(parse_error)
! construct xx$0 only allowed in become-such-substitutions
! Line: 2 Column: 21 in file: /Users/leuschel/git_root/prob_examples/public_examples/B/FeatureChecks/AssignByPredicateWithDEF.mch
*/