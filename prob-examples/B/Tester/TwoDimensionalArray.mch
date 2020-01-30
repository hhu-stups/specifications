MACHINE TwoDimensionalArray
DEFINITIONS
  IDX == 1..3;
  SET_PREF_MAX_OPERATIONS == 10
VARIABLES ar
INVARIANT
 ar: IDX --> (IDX --> NAT)
INITIALISATION ar:= %(i).(i:IDX | %j.( j:IDX | 0))
OPERATIONS
  Inc(x,y) = PRE x:IDX & y:IDX & ar(x)(y)<MAXINT THEN
    ar(x)(y) := ar(x)(y) + 1
  END;
  r <-- Get(x,y) = PRE x:IDX & y:IDX THEN
    r := ar(x)(y)
  END
END

