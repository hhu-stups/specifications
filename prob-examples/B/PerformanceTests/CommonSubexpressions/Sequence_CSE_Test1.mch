MACHINE Sequence_CSE_Test1
DEFINITIONS SET_PREF_CSE == TRUE; SET_PREF_CSE_SUBST == TRUE
VARIABLES n,x,y,z
INVARIANT
  n:NATURAL &
  x: INTEGER & y:INTEGER & z:INTEGER
INITIALISATION n,x,y,z := 0,0,0,0
OPERATIONS
  IncN = SELECT n<100 THEN n:= (n+1)*2 END;
  Modify = SELECT x+1 < 100 THEN
             x := x+1;
             y := x+1;
             z := x+1
           END
END