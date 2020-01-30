MACHINE SudokuAsConstant
/* still took too long compared to enumerate sets solution (5.97 seconds) ! */
/* Now 0.86 seconds with AVL waitflags store; 0.35 with 1.3.3 */
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
   
   Board(1)(1)=7 & Board(1)(2)=8  & Board(1)(3)=1 & Board(1)(4)=6 & Board(1)(6)=2 
                 & Board(1)(7)=9 & Board(1)(9) = 5 &
   Board(2)(1)=9 & Board(2)(3)=2 & Board(2)(4)=7 & Board(2)(5)=1 &
   Board(3)(3)=6 & Board(3)(4)=8 & Board(3)(8)=1 & Board(3)(9)=2 &
   
   Board(4)(1)=2 & Board(4)(4)=3 & Board(4)(7)=8 & Board(4)(8)=5 & Board(4)(9)=1 &
   Board(5)(2)=7 & Board(5)(3)=3 & Board(5)(4)=5 & Board(5)(9)=4 &
   Board(6)(3)=8 & Board(6)(6)=9 & Board(6)(7)=3 & Board(6)(8)=6 &
   
   Board(7)(1)=1 & Board(7)(2)=9 & Board(7)(6)=7 & Board(7)(8)=8 &
   Board(8)(1)=8 & Board(8)(2)=6 & Board(8)(3)=7 & Board(8)(6)=3 & Board(8)(7)=4 & Board(8)(9)=9 &
   Board(9)(3)=5 & Board(9)(7)=1
   
OPERATIONS
  domx <-- GetForallDom = BEGIN domx := {x1,x2|x1:DOM & x1<x2 & x2:DOM} END;
  val <-- Get(x,y) = PRE x:DOM & y:DOM THEN val := Board(x)(y) END
END
  
