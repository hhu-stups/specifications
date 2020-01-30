MACHINE SudokuAsConstantsNorvigImpossible_Kodkod
/* an impossible hard Puzzle by Norvig http://norvig.com/sudoku.html; took Norvig 24 minutes and took
   21 minutes with ProB on original formulation;
   with new Kodkod external function bridge total time about 4 seconds, 
   about 0.7 seconds SAT translation and solving time:
     Kodkod Statistics: 415 ms translation, 270 ms solving, 309151 clauses, 155235 variables, 6724 primary variables
   Note: the higher-order SUBSQ set gets compiled away; only the constraints on Board are sent to Kodkod and then to SAT
   With the FM'12 Kodkod backend it was very difficult to write a version of the puzzle that could be translated.
   
   Other links: http://bramcohen.livejournal.com/70250.html
   http://stackoverflow.com/questions/2075487/on-sudoku-solving/2075498#2075498
   http://www-cs-faculty.stanford.edu/~uno/programs/sudoku.w
 */

  /*
  An image of Norvig's puzzle:
. . . |. . 5 |. 8 . 
. . . |6 . 1 |. 4 3 
. . . |. . . |. . . 
------+------+------
. 1 . |5 . . |. . . 
. . . |1 . 6 |. . . 
3 . . |. . . |. . 5 
------+------+------
5 3 . |. . . |. 6 1
. . . |. . . |. . 4
. . . |. . . |. . . 
*/
DEFINITIONS n == 9; DOM == 1..9; D1 == 1..8; D2 == 2..9 ; IDX == 1..(9*9);
      SUBSQ == { {1,2,3}, {4,5,6}, {7,8,9} };
      ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:1..9 & c:1..9 & i=0};
      ANIMATION_FUNCTION == ( {r,c,i|r:DOM & c:DOM & i:DOM &  i = Board(apos(r,c))} );
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
 
      SET_PREF_MAX_INITIALISATIONS == 1;
      SET_PREF_TIME_OUT == 4500;
      EXTERNAL_PREDICATE_KODKOD(T1,T2) == INTEGER*T1*T2*BOOL;
      KODKOD(ID,Ids,WaitIds,BoolExpr)==BoolExpr=TRUE;
      EXTERNAL_PREDICATE_KODKOD_SOLVE(T1,T2) == INTEGER*T1*T2;
      KODKOD_SOLVE(ID,Ids,WaitIds)==(1=1);
      SET_PREF_KODKOD == FALSE;
      SET_PREF_KODKOD_ONLY_FULL == FALSE;
      SET_PREF_KODKOD_MAX_NR_SOLS == 1;
      SET_PREF_KODKOD_SAT_SOLVER == "glucose";
      SET_PREF_KODKOD_SYMMETRY == 20;
      
      apos(i,j) == (i-1)*n+j; // converting two dimensional coordinates to one dimensional
CONSTANTS
  Board
PROPERTIES
  !y.(y:DOM => !(x1,x2).(x1:D1 & x1<x2 & x2:D2
           =>    KODKOD(1,Board,(x1,y,x2,y),
                        bool(Board(apos(x1,y)) /= Board(apos(x2,y)) &
                             Board(apos(y,x1)) /= Board(apos(y,x2)))))) &
  !(s1,s2).(s1:SUBSQ & s2:SUBSQ =>
             !(x1,y1,x2,y2).( (x1:s1 & x2:s1 & x1>=x2 & (x1=x2 => y1>y2) &
                               y1:s2 & y2:s2 & (x1,y1) /= (x2,y2))
                              =>
                              KODKOD(1,Board,(x1,y1,x2,y2),bool(Board(apos(x1,y1)) /= Board(apos(x2,y2))))
                            ))
                            
   & /* PUZZLE CONSTRAINTS : */
   
    KODKOD(1,Board,n,
		bool(
            Board : (IDX --> DOM)   &
			// Board(apos(1,5)) = 5 &  Board(apos(1,6)) = 2 &  Board(apos(1,8)) = 4 & Board(apos(2,1)) = 1 
			
			// Norvig impossible Puzzle 
   			   Board(apos(1,6))=5 & Board(apos(1,8)) = 8 &
			   Board(apos(2,4))=6 & Board(apos(2,6))=1 & Board(apos(2,8))=4 & Board(apos(2,9))=3 &
   
			   Board(apos(4,2))=1 & Board(apos(4,4))=5 &
			   Board(apos(5,4))=1 & Board(apos(5,6))=6 &
			   Board(apos(6,1))=3 & Board(apos(6,9))=5  &
   
			   Board(apos(7,1))=5 & Board(apos(7,2))=3 & Board(apos(7,8))=6 
			   /* up until here the Puzzle can be solved by ProB alone */
			   /* from here it starts getting difficult for ProB alone */
			   & Board(apos(7,9))=1 
               & Board(apos(8,9))=4
    
		)
	)
      &
    KODKOD_SOLVE(1,Board,n)
   
OPERATIONS
  domx <-- GetForallDom = BEGIN domx := {x1,x2|x1:DOM & x1<x2 & x2:DOM} END;
  val <-- Get(x,y) = PRE x:DOM & y:DOM THEN val := Board(apos(x,y)) END
END
