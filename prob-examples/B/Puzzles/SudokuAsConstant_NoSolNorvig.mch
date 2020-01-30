MACHINE SudokuAsConstant
/* 
From http://norvig.com/sudoku.html
Here is the impossible puzzle that took 1439 seconds (about 24 minutes):

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

ProB takes 
$ time probcli SudokuAsConstant_NoSolNorvig.mch -p TIME_OUT 50000000 -init
% set_pref(MAX_OPERATIONS,maxNrOfEnablingsPerOperation,82)
% set_pref(MAXINT,maxint,3)
! *** error occurred ***
! setup_constants_fails
! ### Processing file failed: 
! /Users/leuschel/git_root/prob_examples/public_examples/B/Puzzles/SudokuAsConstant_NoSolNorvig.mch


real	21m3.930s
user	21m2.131s
sys	0m1.379s
*/
DEFINITIONS DOM == 1..9; D1 == 1..8; D2 == 2..9 ;
 SET_PREF_MAXINT == 3;
 SUBSQ == { {1,2,3}, {4,5,6}, {7,8,9} };
     ANIMATION_FUNCTION_DEFAULT == {r,c,i|r:1..9 & c:1..9 & i=0};
     ANIMATION_FUNCTION == ( {r,c,i|r:DOM & c:DOM & i:DOM &  i = Board(r)(c)} );
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
 SET_PREF_MAX_OPERATIONS == 82
CONSTANTS
  Board
PROPERTIES
  Board : DOM --> (DOM --> DOM)   &
  !y.(y:DOM => !(x1,x2).(x1:D1 & x1<x2 & x2:D2  => (Board(x1)(y) /= Board(x2)(y) &
                                                    Board(y)(x1) /= Board(y)(x2)))) &
  !(s1,s2).(s1:SUBSQ & s2:SUBSQ =>
             !(x1,y1,x2,y2).( (x1:s1 & x2:s1 & x1>=x2 & (x1=x2 => y1>y2) &
                               y1:s2 & y2:s2 & (x1,y1) /= (x2,y2))
                              =>
                              Board(x1)(y1) /= Board(x2)(y2)
                            ))
                            
   & /* PUZZLE CONSTRAINTS : */
   
   Board(1)(6)=5 & Board(1)(8) = 8 &
   Board(2)(4)=6 & Board(2)(6)=1 & Board(2)(8)=4 & Board(2)(9)=3 &
   
   Board(4)(2)=1 & Board(4)(4)=5 &
   Board(5)(4)=1 & Board(5)(6)=6 &
   Board(6)(1)=3 & Board(6)(9)=5  &
   
   Board(7)(1)=5 & Board(7)(2)=3 & Board(7)(8)=6 /* up until here the Puzzle can be solved in 1 second */
/* from here it starts getting difficult */
  & Board(7)(9)=1 &
    Board(8)(9)=4
   
OPERATIONS
  domx <-- GetForallDom = BEGIN domx := {x1,x2|x1:DOM & x1<x2 & x2:DOM} END;
  val <-- Get(x,y) = PRE x:DOM & y:DOM THEN val := Board(x)(y) END
END
  
