MACHINE SeqCheck
VARIABLES f
INVARIANT
 f:INTEGER +-> INTEGER
INITIALISATION f:={}
OPERATIONS
  SetFPower(x) = PRE x:1..5 THEN f := %y.(y:1..10**x|y+1) END;
  SetF1(x) = PRE x:1..3 THEN f := %y.(y:1..x|y+1) END;
  c <-- FCard = BEGIN c:= card(f) END;
  CheckSeq = PRE f: seq(INTEGER) THEN skip END /* initially timeout ; now 230ms */
  ;
  res <-- CheckTotalFun(x) = PRE x:1..5 THEN
    IF f: 1..10**x --> INTEGER THEN res := TRUE ELSE res := FALSE END
  END /* was 1340 ms for x=5 after SetFPower(5); 150 ms initially
         was 760 ms for x=1 after SetFPower(5); 70 ms initially */
END

