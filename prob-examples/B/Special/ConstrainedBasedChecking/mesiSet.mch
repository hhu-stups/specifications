MACHINE mesiSet(C)
VARIABLES m,e,s,i
INVARIANT
 m: POW(C) & e: POW(C) & s: POW(C) & i: POW(C) & 
 m \/ e \/ s \/ i = C &
 !(j,k).(j:{m,e,s,i} & k:{m,e,s,i} & j /= k => j/\k={}) &
 (card(s)>0 => card(m)=0)
INITIALISATION m,e,s,i := {},{},{},C
OPERATIONS
  setWriteInvalidate = ANY p WHERE p:C & p:s THEN
    m,e,s,i := {},{p},{},i\/m\/e\/(s - {p})
  END;
  sendRead = ANY p WHERE p:C & p:i THEN
    m,e,s,i := {},{},m\/e\/ s \/ {p}, i-{p}
  END;
  write = ANY p WHERE p:C & p:e THEN    /* INVARIANT VIOLATION FOUND after write; took several minutes in the past; now is almost instaneous */
    e,m := e-{p},m\/{p}
  END
END

