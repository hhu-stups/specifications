MACHINE VerySimpleDFA
/* used to check output of transition diagram; test 1405 */
VARIABLES s, r
INVARIANT
 s:0..3 & r:0..3
INITIALISATION s:=0 || r:= 0
OPERATIONS
  Inc = SELECT s<3 THEN s := s+1 END;
  Reset = SELECT s=3 THEN s:= 0 || r:= 1-r END;
  Reset1 = SELECT s=3 & r=1 THEN s:= 0 || r:= 1-r END;
  OptReset = IF s=3 THEN s:= 0 END;
  OptReset1 = IF s=3 & r=1 THEN s:= 0 END
END

