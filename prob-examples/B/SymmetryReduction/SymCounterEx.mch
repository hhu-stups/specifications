MACHINE SymCounterEx
SETS  S={s1,s2,s3}
VARIABLES x
INVARIANT  x:POW(S) & card(x)=1
INITIALISATION  x : (x:POW(S) & card(x)=1)
OPERATIONS
  add = BEGIN x := x \/ {s1} END
END