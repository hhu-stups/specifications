MACHINE Alternate
DEFINITIONS SET_PREF_MAXINT == 4; c==3
CONSTANTS f
PROPERTIES
 f: 0..100 --> NATURAL &  /* 5^100 possibilities */
 f(0) : 0..c-1 &
 !t.(t:0..100 & t>0 => f(t) = (f(t-1)+1) mod c)
VARIABLES i
INVARIANT i:ran(f)
INITIALISATION i:=f(0)
OPERATIONS
  Iterate = i := f(i)
END

