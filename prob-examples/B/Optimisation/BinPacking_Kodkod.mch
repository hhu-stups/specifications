MACHINE BinPacking_exec
// a non-optimizing version
// to be used for Kodkod; but Kodkod says
// kodkod fail: !b.(b : ran(sol) & b : 1 .. bins => SIGMA(z).(z : ...  , reason: integer without upper and lower bound in: z while applying rewriting rules
SETS
  OBJECTS = {o1, o2, o3, o4, o5, o6, o7}
DEFINITIONS
  is_solution (x,n) == (x : OBJECTS --> (1.. n) &
   !(b).(b:ran(x) & b:1..n 
         => SIGMA(z).(z:{o1, o2, o3, o4, o5, o6, o7} & z:x~[{b}] | object_volume(z)) <= 100) &
   symm_break(x)
  );
  symm_break(y) == (y(o1)=1  );
  SET_PREF_MAX_INITIALISATIONS == 4;
  SET_PREF_KODKOD == TRUE;
  LIM == 100;
  bin_volumes(sl) == %(b).(b:ran(sl)|SIGMA(x).(x|->b:sl|object_volume(x)))
CONSTANTS object_volume, sol, bins
PROPERTIES
object_volume : OBJECTS --> 1 .. LIM &
  object_volume ( o1 ) = 34
& object_volume ( o2 ) = 18
& object_volume ( o3 ) = 56
& object_volume ( o4 ) = 63
& object_volume ( o5 ) = 82
& object_volume ( o6 ) = 1
& object_volume ( o7 ) = 89 

& is_solution(sol,bins)
& bins : 3..5
END

