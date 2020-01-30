MACHINE SORT_External
DEFINITIONS
 "SORT.def"
SETS
 ID={aa,bb,cc}
VARIABLES ss
INVARIANT
 ss : POW(INTEGER)
INITIALISATION ss := {}
OPERATIONS
  res <-- SetToSeq = BEGIN res:= SORT(ss) END;
  add(i) = PRE i=card(ss) THEN ss := ss \/ {i} END
ASSERTIONS
  SORT({3,2,1}) = [1,2,3];
  SORT({"a","c","b"}) = ["a","b","c"];
  SQUASH( { 2|->"a"} ) = ["a"];
  SQUASH( { 2|->"a", 4|->"b"} ) = ["a","b"]
END

