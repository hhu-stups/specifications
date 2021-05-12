MACHINE BecomesSuchTest
DEFINITIONS SET_PREF_MAX_OPERATIONS == 16
OPERATIONS
     res <-- div_2_1 (nn) =
      PRE
         nn : 0..15
      THEN
         res : (res : INTEGER &
                nn - res * 2 ** 1 : 0 .. 2 ** 1 - 1)
      END;

   res <-- div_2_2 (nn) =
      PRE
         nn : 0..15
      THEN
         res : (res : INTEGER &
                nn - res * 2 ** 2 : 0 .. 2 ** 2 - 1)
      END;

   res <-- test (nn) =
      PRE
         nn : 0..1
      THEN
         res : (res : 0..1 & res$0 < 0)  // This operation reads output variable
      END
END

/*
old probcli would generate:

! Message (source: bmachine):
! Operation div_2_1 is possibly reading output parameters: [res]
! Line: 4 Column: 5 until Line: 4 Column: 8 in file: /Users/leuschel/git_root/prob_examples/public_examples/B/Tester/ReadWriteAnalysis/BecomesSuchTest.mch
! Message (source: bmachine):
! Operation div_2_2 is possibly reading output parameters: [res]
! Line: 12 Column: 3 until Line: 12 Column: 6 in file: /Users/leuschel/git_root/prob_examples/public_examples/B/Tester/ReadWriteAnalysis/BecomesSuchTest.mch


*/
