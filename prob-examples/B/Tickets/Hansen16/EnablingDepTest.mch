MACHINE EnablingDetTest
/* Test that following events are recognized as dependent */
SETS
 ID={aa,bb,cc}
VARIABLES xx
INVARIANT
 xx<:ID
INITIALISATION xx:={}
OPERATIONS
  ContainsIv = PRE aa:xx THEN skip END;
  AddIv = SELECT aa /: xx THEN xx:= xx\/ {aa} END
END

