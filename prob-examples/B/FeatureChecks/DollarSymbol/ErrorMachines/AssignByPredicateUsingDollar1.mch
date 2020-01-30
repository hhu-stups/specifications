MACHINE AssignByPredicateWithDEF
DEFINITIONS lt == xx<xx$0+10
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
  Inc = PRE xx<1000 THEN
    xx : (xx>xx$1 & lt)
  END;
  r <-- Get = BEGIN r:=xx END
END

/*
! An error occurred !
! source(parse_error)
! construct $ only allowed with zero here (xx$0)
! Line: 9 Column: 13 in file: /Users/leuschel/git_root/prob_examples/public_examples/B/FeatureChecks/DollarSymbol/ErrorMachines/AssignByPredicateUsingDollar1.mch

*/