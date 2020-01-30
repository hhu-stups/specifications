MACHINE GolferSchoolGirls_v2
/* cannot currently be solved by ProB in this representation */
SETS
 Girls; Days
CONSTANTS walk
PROPERTIES
  card(Girls) = 15 & card(Days) = 7 &
  walk : Days --> (Girls --> 1..5) &
  !(d,i).(d:Days & i:1..5 => card(walk(d)~[{i}])=3) &
  !(g1,g2).(g1:Girls & g1/=g2 => #(d).(d:Days & walk(d)(g1)=walk(d)(g2) )) &
  !(g1,g2,d1).(g1:Girls & g1/=g2 & d1:Days &
      walk(d1)(g1)=walk(d1)(g2) => !d2.(d2/=d1 => walk(d2)(g1)/=walk(d2)(g2))
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