MACHINE SudokuAsConstantNoSolution
/* An Sudoku puzzle with no solution to illustrate Debugging an unsat Core computation of ProB */
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
   
 /* Unsolvable; from Ermina Torlak's PhD; page 21, Figure 1-6 */
    
	Board(1)(6) = 3 & 
	Board(1)(9) = 8 
 &
	Board(2)(1) = 2 &
	Board(2)(4) = 4 &
	Board(2)(7) = 1 &
	Board(2)(8) = 9 &
	Board(2)(9) = 6
 &
	Board(3)(2) = 1 &
	Board(3)(3) = 8 &
	Board(3)(6) = 9 &
	Board(3)(7) = 3 &
	Board(3)(8) = 5
 &
	Board(4)(6) = 6 &
	Board(4)(7) = 9 &
	Board(4)(8) = 1
 &
	Board(5)(4) = 3 &
	Board(5)(5) = 9 &
	Board(5)(6) = 7
 &
	Board(6)(2) = 3 &
	Board(6)(3) = 5 &
	Board(6)(4) = 8
 &
	Board(7)(3) = 1 &
	Board(7)(4) = 9
 &
	Board(8)(1) = 8 &
	Board(8)(2) = 9 &
	Board(8)(3) = 4 &
	Board(8)(6) = 5 &
	Board(8)(7) = 6
 &
	Board(9)(1) = 3 &
	Board(9)(2) = 5 &
	Board(9)(4) = 6 &
	Board(9)(8) = 4 &
	Board(9)(9) = 2   /* without this line the puzzle is solvable */


/* Outcome of ProB Debugging:
 SOLUTION
   == Board=[[5,6,9,1,7,3,4,2,8],[2,7,3,4,5,8,1,9,6],[4,1,8,2,6,9,3,5,7],[7,8,2,5,4,6,9,1,3],[1,4,6,3,9,7,5,8,2],[9,3,5,8,1,2,7,6,4],[6,2,1,9,3,4,8,7,5],[8,9,4,7,2,5,6,3,1],[3,5,7,6,8,1,2,4,9]]
 
 ********
 
First unsatisfiable PROPERTY or CONSTRAINT:
 Board(9)(9) = 2
   == false
   
After Minimisation:

SATISFIABLE CONSTRAINTS and PROPERTIES (with first solution):
 (only a sub-component was analysed)
 Board : 1 .. 9 --> (1 .. 9 --> 1 .. 9)
 !(y).(y : 1 .. 9 => !(x1,x2).((x1 : 1 .. 8 & x1 < x2) & x2 : 2 .. 9 => Board(x1)(y) /= Board(x2)(y) & Board(y)(x1) /= Board(y)(x2)))
 !(s1,s2).(s1 : {{1,2,3},{4,5,6},{7,8,9}} & s2 : {{1,2,3},{4,5,6},{7,8,9}} => !(x1,y1,x2,y2).((((((x1 : s1 & x2 : s1) & x1 >= x2) & (x1 = x2 => y1 > y2)) & y1 : s2) & y2 : s2) & (x1 |-> y1) /= (x2 |-> ...
 Board(3)(6) = 9
 Board(4)(7) = 9
 Board(7)(4) = 9
 Board(8)(2) = 9
 Board(9)(8) = 4
 SOLUTION
   == Board=[[7,1,9,5,3,6,4,8,2],[2,6,4,7,1,8,5,9,3],[3,8,5,4,2,9,6,1,7],[1,3,2,8,4,7,9,5,6],[8,4,6,3,9,5,7,2,1],[9,5,7,2,6,1,8,3,4],[4,2,8,9,7,3,1,6,5],[6,9,3,1,5,4,2,7,8],[5,7,1,6,8,2,3,4,9]]
 
 ********

First unsatisfiable PROPERTY or CONSTRAINT:
 Board(9)(9) = 2
   == false


*/
   
OPERATIONS
  domx <-- GetForallDom = BEGIN domx := {x1,x2|x1:DOM & x1<x2 & x2:DOM} END;
  val <-- Get(x,y) = PRE x:DOM & y:DOM THEN val := Board(x)(y) END
END
  
