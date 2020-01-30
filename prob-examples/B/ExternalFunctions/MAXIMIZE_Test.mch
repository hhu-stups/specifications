MACHINE MAXIMIZE_Test
DEFINITIONS
  EXTERNAL_FUNCTION_MAXIMIZE(T) == POW(T) --> T;
  MAXIMIZE(x)==1
CONSTANTS m,v
PROPERTIES
  m = 1..20 &
  v = MAXIMIZE(/*@ symbolic */ {s,v,w|v:m & w:NATURAL & s=v-w}) // try and find a maximum for v-m
ASSERTIONS
  v = (20,20,0);
  MAXIMIZE({f,x|f=10*x-x*x & x<1000}) = (25,5);
  MAXIMIZE({f,x|f=100*x-x*x & x<1000}) = (2500,50)
END

