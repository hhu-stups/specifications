MACHINE Abstract
DEFINITIONS
 ASSERT_LTL_TRUE == "G( {s=1} => X {s=3})"  /* This formula is true */
VARIABLES s
INVARIANT
 s:0..4
INITIALISATION s:=0
OPERATIONS
  AOp1 = SELECT s=0 THEN s::{1,2} END;
  AOp2 = SELECT s:{1,2} THEN
            IF s=1 THEN s:=3 ELSE s:= 4 END
         END
END

