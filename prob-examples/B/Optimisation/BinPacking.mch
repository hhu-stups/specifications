MACHINE BinPacking
SETS
  OBJECTS = {o1, o2, o3, o4, o5, o6, o7}
CONSTANTS object_volume
PROPERTIES
object_volume : OBJECTS --> 1 .. 100 &
  object_volume ( o1 ) = 34
& object_volume ( o2 ) = 18
& object_volume ( o3 ) = 56
& object_volume ( o4 ) = 63
& object_volume ( o5 ) = 82
& object_volume ( o6 ) = 1
& object_volume ( o7 ) = 89

DEFINITIONS
  is_solution (x) == (x : OBJECTS --> (1.. card(OBJECTS)) &
   !(b).(b:ran(x) => SIGMA(z).(z:x~[{b}] | object_volume(z)) <= 100));
  quality(x) == max(ran(x));
  is_better(x,y) == x>y
VARIABLES
solution , current_quality
INVARIANT
 solution : OBJECTS --> NATURAL1 &
 current_quality : NATURAL
INITIALISATION ANY s
 WHERE is_solution ( s )
 THEN solution , current_quality := s , quality ( s )
END
OPERATIONS
improve =
ANY s , q
WHERE is_solution ( s ) &
q = quality(s) &
is_better (q, current_quality ) THEN solution , current_quality := s , q
END ; optimum_reached =
PRE !(s).(is_solution(s) =>
not( is_better( quality(s), current_quality )))
THEN skip
END END
