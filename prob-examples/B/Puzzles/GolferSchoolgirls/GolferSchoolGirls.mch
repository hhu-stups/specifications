MACHINE GolferSchoolGirls
/* simplified puzzle can currently be solved by ProB in this representation */
SETS
 Girls; Days
DEFINITIONS 
 SET_PREF_MAX_INITIALISATIONS == 1;
 ANIMATION_FUNCTION_DEFAULT == { 0|-> ["Groups"]};
 ANIMATION_STR_JUSTIFY_RIGHT == TRUE;
 ANIMATION_FUNCTION == {r,c,i|r:Days & c=1 & i=walk(r)}
CONSTANTS 
  group_size, groups, walk
PROPERTIES
  group_size = 3 & groups = 5 &
  card(Girls) = group_size*groups &
  card(Days) = 5 &
  walk : Days --> POW(POW(Girls)) &
  !d.(d:Days => card(walk(d)) = groups &  
         /* union(walk(d))=Girls &  this still considerably slows things down */
         !(a).(a:walk(d) => card(a)=group_size))
  &
/*
  !(d,g1,g2).(d:Days & g1:walk(d) & g2:walk(d) & g1 /= g2 =>  g1 /\ g2 = {}) 
   has to be written like this for performance:  do this automatically ?? */

  !(d).(d:Days => !g1.( g1:walk(d) => !g2. (g2:walk(d) & g1 /= g2 =>  g1 /\ g2 = {}) ))

  &

  !(d1,d2).(d1:Days & d2:Days & d1 /= d2 =>  walk(d1) /\ walk(d2) = {}) 

ASSERTIONS
!(d,g1,g2).(d:Days & g1:walk(d) & g2:walk(d) & g1 /= g2 =>  g1 /\ g2 = {}) ;
!d.(d:Days=>union(walk(d))=Girls)

/*  !(g1,g2).(g1:Girls & g1/=g2 => #(d).(d:Days & #ww.(ww:walk(d) & {g1,g2} <: ww))) */
END

/*
From http://www.reddit.com/r/prolog/comments/2v4fs5/schoolgirlgolfer_problem_i_always_get_stuck_with/

% In a boarding school there are fifteen schoolgirls who always take their
% daily walks in groups of three.
%
% How can it be arranged so that each schoolgirl walks in a group with two
% different companions every day for a week (7 days)?


*/