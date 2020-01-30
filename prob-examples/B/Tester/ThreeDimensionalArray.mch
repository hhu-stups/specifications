MACHINE ThreeDimensionalArray
DEFINITIONS
  IDX == 1..3;
  SET_PREF_MAX_OPERATIONS == 28
VARIABLES ar
INVARIANT
 ar: IDX --> (IDX --> (IDX --> NAT))
INITIALISATION ar:= %(i).(i:IDX | %j.( j:IDX | %k.( k:IDX | 0)))
OPERATIONS
  Inc(x,y) = PRE x:IDX & y:IDX & ar(x)(y)(x)<MAXINT THEN
    ar(x)(y)(x) := ar(x)(y)(x) + 1
  END;
  r <-- Get(x,y,z) = PRE x:IDX & y:IDX & z:IDX THEN
    r := ar(x)(y)(z)
  END
END

