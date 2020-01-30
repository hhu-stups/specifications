#! /Users/leuschel/git_root/prob_prolog/probcli
MACHINE BinPacking_exec
// a version that can be run using -execute_all
SETS
  OBJECTS = {o1, o2, o3, o4, o5, o6, o7}
DEFINITIONS
  is_solution (x,n) == (x : OBJECTS --> (1.. n) &
   !(b).(b:ran(x) => SIGMA(z).(z:x~[{b}] | object_volume(z)) <= 100) &
   symm_break(x)
  );
  symm_break(y) == (y(o1)=1  );
  EXTERNAL_FUNCTION_MAXIMIZE(T) == POW(T) --> T;
  MAXIMIZE(x)==1;
  LIM == 100;
  bin_volumes(sl) == %(b).(b:ran(sl)|SIGMA(x).(x|->b:sl|object_volume(x)))
CONSTANTS object_volume
PROPERTIES
object_volume : OBJECTS --> 1 .. LIM &
  object_volume ( o1 ) = 34
& object_volume ( o2 ) = 18
& object_volume ( o3 ) = 56
& object_volume ( o4 ) = 63
& object_volume ( o5 ) = 82
& object_volume ( o6 ) = 1
& object_volume ( o7 ) = 89 

VARIABLES bins,sol, found, binvols
INVARIANT
  bins : 1..card(OBJECTS) & sol : OBJECTS +-> 1..bins & found:BOOL & binvols : (1..bins)+->1..LIM
INITIALISATION
  bins := 1 || sol := {} || found := FALSE || binvols := {}
OPERATIONS
   Solve(s) = SELECT found=FALSE & is_solution(s,bins) THEN
        sol := s || found := TRUE || binvols := bin_volumes(s)
   END;
  IncBinSize = SELECT found=FALSE THEN bins := bins+1 END
END

