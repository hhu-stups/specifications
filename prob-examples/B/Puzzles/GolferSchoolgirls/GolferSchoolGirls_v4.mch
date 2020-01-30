MACHINE GolferSchoolGirls_v4
/* can currently be solved for 7 Days in less than 0.2 secs; 10 days in 0.4 secs;
   20 days in 1.8 sec
   It requires all groups to be different but not that one meets only new girls
   This is what the Prolog solution does ?
 */
DEFINITIONS
 Girls == 1..15; Girl1 == 1;
 LastDay  == 20;
 Days == 1..LastDay; 
 Index == 1..15;
 SET_PREF_MAX_INITIALISATIONS == 1;
 ANIMATION_FUNCTION_DEFAULT == { 0|-> ["G1","G1","G1", "G2","G2","G2", "G3","G3","G3", "G4","G4","G4", "G5","G5","G5"]};
 ANIMATION_STR_JUSTIFY_RIGHT == TRUE;
 ANIMATION_FUNCTION == walk
CONSTANTS walk, GroupStart
PROPERTIES
  GroupStart = {i|i:Index & i mod 3 = 1} &
  walk : Days --> perm(Girls) &
  !d.(d:Days =>  walk(d)(1) = Girl1) /* force first girl */
  &
  !(d,g).(d:Days & g:GroupStart => walk(d)(g) < walk(d)(g+1) & walk(d)(g+1)<walk(d)(g+2)) /* order within groups */
  &
  !(d,g).(d:Days & g:GroupStart & g>3 => walk(d)(g-3) < walk(d)(g)) /* oder groups */
  &
  !(d1,g1).(d1:Days & d1 /= LastDay & g1:GroupStart
        => !(d2,g2).(d2:Days & d2>d1 & g2:GroupStart
                     => (walk(d1)(g1),walk(d1)(g1+1),walk(d1)(g1+2))
                        /= 
                        (walk(d2)(g2),walk(d2)(g2+1),walk(d2)(g2+2))
           )
   )
END

/*
From http://www.reddit.com/r/prolog/comments/2v4fs5/schoolgirlgolfer_problem_i_always_get_stuck_with/

% In a boarding school there are fifteen schoolgirls who always take their
% daily walks in groups of three.
%
% How can it be arranged so that each schoolgirl walks in a group with two
% different companions every day for a week (7 days)?

puzzle(Solution, Solution, []).
puzzle(Solution, Acc, GirlsLeft) :-
    select(Girl1, GirlsLeft, R1),
    select(Girl2, R1, R2),
    select(Girl3, R2, Remaining),
    Girl1 \= Girl2, Girl2 \= Girl3, Girl3 \= Girl1,
    sort([Girl1, Girl2, Girl3], Group), % get rid of
    \+ member(Group, Acc),              % permutations
    append([Group], Acc, NewAcc),
    puzzle(Solution, NewAcc, Remaining).


puzzle(Solution) :-
    puzzle(Solution, [], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]).

go(Solutions, Solutions, end).
go(Solutions, Acc) :-
    (puzzle(Solution) ->
            \+ member(Solution, Solutions),
            append(Solution, Solutions, NewSolutions),
            writef("%w\n", Solution),
            go(NewSolutions) ;
    go(NewSolutions, NewSolutions, end)).

go(Solutions) :- go(Solutions,[]).

*/