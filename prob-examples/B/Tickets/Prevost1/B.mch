MACHINE B SEES C
VARIABLES kk
INVARIANT
 kk:ID
INITIALISATION kk:=aa
END

/*

Correctly generates error message:

! An error occurred !
! source(type_error)
! Identifier 'kk' declared twice, other declaration (Line:Col:File) =  (5:10:C.mch)
! 
 /Users/leuschel/git_root/prob_examples/public_examples/B/Tickets/Prevost1/A.mch
! Line: 2 Column: 10 in file 1

*/