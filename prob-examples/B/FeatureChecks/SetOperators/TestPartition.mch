MACHINE TestPartition
SETS
 ID={aa,bb,cc}
CONSTANTS a,b,S
PROPERTIES
 S = ID*ID &
 a \/ b = S &
 a /\ b = {} &
 card(a) = card(b)+1
OPERATIONS
 c <-- CardA = BEGIN c:= card(a) END;
 c <-- CardB = BEGIN c:= card(b) END
END

