MACHINE Test2
DEFINITIONS
 ASSERT_LTL == "not (GF {addr=c} & GF [C])";
 ASSERT_LTL_WEF == "WEF => not (GF {addr=c} & GF [C])";
 ASSERT_LTL_SEF == "SEF => not (GF {addr=c} & GF [C])";
 ASSERT_LTL_SEF_LTL == "GF e(A) => GF [A] & GF e(BInc) & GF [BInc] => not (GF {addr=c} & GF [C])"
 
CONSTANTS
 c 
PROPERTIES
 c = 4
VARIABLES addr
INVARIANT
 addr:INTEGER
INITIALISATION
 addr := 1
EVENTS
 A(p,q) = SELECT addr=1 & p:INT & q:INT THEN addr:=2
     WHEN addr=3 THEN addr:=2
     WHEN addr>3 & addr mod 2 = 0 THEN addr:=2
     END;
 addr1 <-- B(p) = SELECT addr=3 & p:INT & p=1 THEN addr:=4 || addr1:=p
     END;
 BInc = SELECT addr=4 THEN addr:=5
     WHEN addr>4 & addr<c THEN addr := addr+1
     END;
 C = SELECT addr=2 THEN addr:=3
     END;
 Loop = SELECT addr>4 THEN skip END
END
