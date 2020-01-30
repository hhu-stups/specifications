MACHINE TestPartition2
SETS
 ID={aa,bb,cc}
CONSTANTS a,b,S
PROPERTIES
 S = ID*ID*ID*ID &
 a \/ b = S &
 a /\ b = {} &
 b = ID*{aa}*ID*{cc}
OPERATIONS
 c <-- CardA = BEGIN c:= card(a) END;
 c <-- CardB = BEGIN c:= card(b) END
END

