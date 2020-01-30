#! /Users/leuschel/git_root/prob_prolog/probcli
MACHINE BinPacking_exec_dec
// a version that can be run using -execute_all
// this version starts form a solution and tries to improve it
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
  BINS == 1..card(OBJECTS);
  tot_volume == (SIGMA(o).(o:dom(object_volume)|object_volume(o)));
  bin_volumes(sl) == %(b).(b:ran(sl)|SIGMA(x).(x|->b:sl|object_volume(x)))
CONSTANTS object_volume, min_nr_bins
PROPERTIES
object_volume : OBJECTS --> 1 .. LIM &
  object_volume ( o1 ) = 34
& object_volume ( o2 ) = 18
& object_volume ( o3 ) = 56
& object_volume ( o4 ) = 63
& object_volume ( o5 ) = 82
& object_volume ( o6 ) = 1
& object_volume ( o7 ) = 89 
& min_nr_bins = 1 + ( (tot_volume-1) / LIM)
VARIABLES bins,sol, binvols
INVARIANT
  bins : BINS & sol : OBJECTS --> 1..bins & binvols : (1..bins)+->1..LIM
INITIALISATION
  bins := card(OBJECTS) || sol :: OBJECTS >-> BINS|| binvols := BINS * {1}
OPERATIONS
   BetterSolFound(s,smaller) = SELECT smaller: min_nr_bins..(bins-1) & is_solution(s,smaller) THEN
        sol := s || binvols := bin_volumes(s) || bins := smaller
   END
END

