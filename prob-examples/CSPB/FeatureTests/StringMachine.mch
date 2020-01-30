MACHINE StringMachine
DEFINITIONS
  ID == {"a","b","c"}
VARIABLES mode
INVARIANT
 mode:ID
INITIALISATION mode:="a"
OPERATIONS
  SetMode(yy) = PRE yy:ID & yy/= mode THEN mode:= yy END;
  r <-- GetMode = BEGIN r := mode END;
  Final = PRE mode = "c" THEN skip END;
  IsInitial(b) = PRE b=bool(mode="a") THEN skip END;
  c <-- Count = IF mode = "a" THEN c := 1 ELSIF mode = "b" THEN c:= 2 ELSE c:= 3 END;
  r <-- Contains_mode(s) = PRE s<:ID THEN
      IF mode:s THEN r := TRUE ELSE r:= FALSE END
  END;
  r <-- ID_Sequence = r := ["a","b","c"];
  PairCheck(p) = PRE p:ID*BOOL & prj1(ID,BOOL)(p)=mode <=> prj2(ID,BOOL)(p)=TRUE THEN
    skip
  END
END

