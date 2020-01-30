MACHINE BinPacking_v2
SETS
  OBJECTS = {o1, o2, o3, o4, o5, o6, o7}
DEFINITIONS
  is_solution (x,n) == (x : OBJECTS --> (1.. n) &
   !(b).(b:ran(x) => SIGMA(z).(z:x~[{b}] | object_volume(z)) <= 100) &
   symm_break(x)
  );
  symm_break(y) == (y(o1)=1  );
  EXTERNAL_FUNCTION_MAXIMIZE(T) == POW(T) --> T;
  MAXIMIZE(x)==1
CONSTANTS object_volume, bins,sol
PROPERTIES
object_volume : OBJECTS --> 1 .. 100 &
  object_volume ( o1 ) = 34
& object_volume ( o2 ) = 18
& object_volume ( o3 ) = 56
& object_volume ( o4 ) = 63
& object_volume ( o5 ) = 82
& object_volume ( o6 ) = 1
& object_volume ( o7 ) = 89 &

 (-bins,bins,sol) = MAXIMIZE(/*@ symbolic */ {mb,bins,s|is_solution(s,bins) & bins:1..card(OBJECTS) & mb=-bins})
END

