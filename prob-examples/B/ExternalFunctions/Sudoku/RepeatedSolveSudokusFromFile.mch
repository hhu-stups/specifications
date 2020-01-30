MACHINE RepeatedSolveSudokus
DEFINITIONS
 "LibraryIO.def";
  REPS == MAXINT; /* number of reptitions for solving the puzzles */
  DOM == 1..9; D1 == 1..8; D2 == 2..9 ;
      SUBSQ == { {1,2,3}, {4,5,6}, {7,8,9} };
      ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:1..9 & c:1..9 & i=0};
      ANIMATION_FUNCTION == ( {r,c,i|r:DOM & c:dom(Board(r)) & i:DOM &  i = Board(r)(c)} );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_1.gif";
      ANIMATION_IMG2 == "images/sm_2.gif";
      ANIMATION_IMG3 == "images/sm_3.gif";
      ANIMATION_IMG4 == "images/sm_4.gif";
      ANIMATION_IMG5 == "images/sm_5.gif";
      ANIMATION_IMG6 == "images/sm_6.gif";
      ANIMATION_IMG7 == "images/sm_7.gif";
      ANIMATION_IMG8 == "images/sm_8.gif";
      ANIMATION_IMG9 == "images/sm_9.gif";
      SET_PREF_CLPFD == TRUE
CONSTANTS
  pfile
PROPERTIES
  pfile : STRING &
  pfile = "/Users/leuschel/git_root/probprivate/public_examples/B/ExternalFunctions/Sudoku/sudoku20.txt" 
VARIABLES i, j, Board, puzzlenr, repetitions
INVARIANT i:NATURAL & j:NATURAL & Board : DOM --> (DOM +-> DOM) & puzzlenr:NATURAL1 & repetitions:NATURAL1
INITIALISATION i:=0 || Board := %z.(z:DOM|{}) || j := 1 || puzzlenr := 1 || repetitions := REPS
OPERATIONS
  start = SELECT i=0 THEN
     SEE(pfile) || i := 1
   END;
  c <-- read = SELECT i>0 & i< 10 THEN
     c := GET_CODE(pfile) ; 
     IF c>48 & c<=57 THEN
       Board(i)(j) := c-48
     END;
     IF j>=9 THEN
       j := 1 || i := i+1 ||
       IF i=9 THEN PRINTF("Solving puzzle: ~w~n",puzzlenr); PRINTF("Repetitions: ~w~n",repetitions) END
     ELSE
       j := j+1
     END
   END;
 Solve(B) = SELECT i =10  & B : DOM --> (DOM --> DOM)   &
  !y.(y:DOM => !x.(x:dom(Board(y)) => B(y)(x) = Board(y)(x))) &
  !y.(y:DOM => !(x1,x2).(x1:D1 & x1<x2 & x2:D2  => (B(x1)(y) /= B(x2)(y) &
                                                    B(y)(x1) /= B(y)(x2)))) &
  !(s1,s2).(s1:SUBSQ & s2:SUBSQ =>
             !(x1,y1,x2,y2).( (x1:s1 & x2:s1 & x1>=x2 & (x1=x2 => y1>y2) &
                               y1:s2 & y2:s2 & (x1,y1) /= (x2,y2))
                              =>
                              B(x1)(y1) /= B(x2)(y2)
                            )) THEN
   IF repetitions > 1 THEN
     repetitions := repetitions -1 
   ELSE
     Board := B || i := 11 || PRINTF("Solution found: ~w~n",B)
   END
 END;
 SkipToNextLine = SELECT i=11 THEN
    VAR c,m IN
      c := GET_CODE(pfile);
      m := 200; /* max line length */
      WHILE c /: {13,10,-1} DO
        c := GET_CODE(pfile) ; m := m - 1
      INVARIANT c:INTEGER
      VARIANT m
      END;
      IF c=-1 THEN
        PRINTF("REACHED END OF FILE ~w~n",pfile) || SEEN(pfile) || i := 12
      ELSE
        PRINTF("Skipped to next line and puzzle (~w chars)~n",200-m);
        i := 1; j := 1; Board := %z.(z:DOM|{});
        repetitions := REPS;
        puzzlenr := puzzlenr + 1 /* avoid memoisation */
      END
   END
 END
END