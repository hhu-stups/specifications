MACHINE AssignToFunctions
// Test WD issues when assigning to functions
VARIABLES f1,f2,f3,f4,f5
INVARIANT
 f1 : 1..100 +-> BOOL &
 f2 : (1..10) +-> ((1..10) +-> (1..10)) &
 f3 : ((1..10)*(1..10)) +-> (1..10) &
 f4 : (1..10) +-> ((1..10) +-> ((1..10) +-> (1..10))) &
 f5 : (1..10) --> ((1..10) +-> ((1..10) --> (1..10)))
INITIALISATION f1,f2,f3,f4,f5 := {},{},{},{},%x.(x:1..10|{})
OPERATIONS
  SetF1(a) = PRE a:1..100 THEN f1(a) := TRUE END;
  ToggleF1(a) = PRE a:dom(f1) THEN f1(a) := bool(f1(a)=FALSE) END;
  SetF2_ko(b) = PRE b:1..10 THEN f2(b)(b) := b END ;// has WD error;
  SetF2_init(b) = PRE b:1..10 THEN f2(b) := {} END ;
  SetF2_ok(b) = PRE b:1..10 & b:dom(f2) THEN f2(b)(b) := b END;
  SetF3(b) = PRE b:1..10 THEN f3(b,b) := b END;
  SetF3_ko(b) = PRE b:1..10 THEN f3(f2(b)(b),b) := b END; // has WD error
  SetF4_init(b) = PRE b:1..10 THEN f4(b) := {} END ;
  SetF4_ko(b) = PRE b:1..10 & b:dom(f4) THEN f4(b)(b)(b) := b END; // has WD error;
  SetF4_ok(b) = PRE b:1..10 & b:dom(f4) & b:dom(f4(b)) THEN f4(b)(b)(b) := b END;
  SetF5_ok(b) = PRE b:1..10 & b:dom(f5(b)) THEN f5(b)(b)(b) := b END
END
