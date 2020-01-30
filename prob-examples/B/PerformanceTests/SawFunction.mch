MACHINE SawFunction
DEFINITIONS c==3
CONSTANTS f
PROPERTIES
 f: 0..100 --> NATURAL & 
 f(0) : 0..c-1 &
 !t.(t:0..100 & t>0 => f(t) = (f(t-1)+1) mod c)
END
