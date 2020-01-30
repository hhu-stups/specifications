MACHINE GolferSchoolGirls_v3
/* cannot currently be solved until 5 Days in less than 2 secs */
DEFINITIONS
 Girls == 1..15; Girl1 == 1;
 LastDay  == 5;
 Days == 1..LastDay; 
 Index == 1..15;
 SET_PREF_MAX_INITIALISATIONS == 1;
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
  !(d1,g).(d1:Days & d1 /= LastDay & g:GroupStart
        => !(i,j,s).(i:g..g+1 & j:g+1..g+2 & i<j & s = walk(d1)[{i,j}]
             =>  !(d2,g2).(d2:Days & d2>d1 & g2:GroupStart
                     =>  s /<: walk(d2)[g2..g2+2]
                  )
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