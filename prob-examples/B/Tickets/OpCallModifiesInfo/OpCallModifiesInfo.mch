MACHINE OpCallModifiesInfo
/* Test that Modifies info correctly computed for Step1,... ; otherwise cbc_sequence 
   and other cbc operations will fail (cbc_tests, bmc) */
INCLUDES Status
VARIABLES pc
INVARIANT
 pc:NATURAL &
 (pc = 0 => status=TRUE) /* this invariant is violated after 3 steps */
INITIALISATION pc:=0
OPERATIONS
  Step1 = SELECT pc=0 THEN pc:=1 || Toggle END;
  Step2 = SELECT pc=1 THEN pc:=2 || Toggle END;
  Step3 = SELECT pc=2 THEN pc:=0 || Toggle END
END

