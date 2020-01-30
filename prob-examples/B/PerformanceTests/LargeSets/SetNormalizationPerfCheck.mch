MACHINE SetNormalizationPerfCheck
VARIABLES
  counter, curset, allsets
INVARIANT
 counter:NATURAL & curset <: NATURAL & allsets <: POW(NATURAL)
INITIALISATION
  counter,curset,allsets := 1,{},{}
OPERATIONS
  add(c) = PRE c=counter & c<1000 THEN
    counter := counter+2 ||
    curset := curset \/ {counter} ||
    allsets := allsets \/ {curset}
  END
END
