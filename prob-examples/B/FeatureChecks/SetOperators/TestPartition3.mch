MACHINE TestPartition3
SETS
 ID={aa,bb,cc}
CONSTANTS a,b,c,S
PROPERTIES
 S = ID*ID*ID*ID &
 a \/ b \/ c = S &
 a /\ b = {} & a /\ c = {} & b /\ c = {} &
 b = ID*{aa}*ID*{cc} &
 c = ID*{bb}*ID*{cc}
OPERATIONS
 rc <-- CardA = BEGIN rc:= card(a) END;
 rc <-- CardB = BEGIN rc:= card(b) END;
 rc <-- CardC = BEGIN rc:= card(c) END
END

