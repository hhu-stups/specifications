MACHINE ASSERT_Enabled_Test
DEFINITIONS
  SET_PREF_ASSERT_CHECKING == TRUE // check ASSERT predicates
VARIABLES xx
INVARIANT
 xx:NATURAL1
INITIALISATION xx:=1
OPERATIONS
  Inc = PRE xx<6 THEN
     ASSERT xx mod 2 = 1 THEN
        xx := xx+1
     END
   END;
  Inc2 = PRE xx<6 THEN xx := xx+2 END;
  Reset = PRE xx=6 THEN xx := 1 END
END

