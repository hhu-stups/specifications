MACHINE SamuraiSudoku
/* by Michael Leuschel, September 2012 */
DEFINITIONS
  DOM == 1..21;
  SUBSQS(C) == /* Subsquare indices */
               {{C,C+1,C+2}, {C+3,C+4,C+5}, {C+6,C+7,C+8}};
  Sol(C1,C2,R1,R2) == (
   /* True if we have a Sudoku from column C1, row R1 to column C2, row R2 */
    !(x,y).(x:C1..C2 & y:R1..R2 => Board(x,y) : 1..9)
   &
    !y.(y:R1..R2 => /* on a row all numbers must be different */
      !(x1,x2).(x1:C1..C2 & x1<x2 & x2:C1..C2  => Board(x1,y) /= Board(x2,y)) )
   & 
    !x.(x:C1..C2 => /* on a column all numbers must be different */
      !(y1,y2).(y1:R1..R2 & y1<y2 & y2:R1..R2  => Board(x,y1) /= Board(x,y2)) )
   &
    !(s1,s2).(s1:SUBSQS(C1) & s2:SUBSQS(R1) =>
        /* within each subsquare all numbers must be different */
             !(x1,y1,x2,y2).( (x1:s1 & x2:s1 & x1>=x2 & (x1=x2 => y1>y2) &
                               y1:s2 & y2:s2 & (x1,y1) /= (x2,y2))
                              =>
                              Board(x1,y1) /= Board(x2,y2)
                            ))
     );
     
      ANIMATION_FUNCTION == Board; /* to visualize the board in Tk */
      ANIMATION_IMG0 == "images/sm_empty_box.gif"; /* Pictures with colours */
      ANIMATION_IMG1 == "images/sm_1.gif";
      ANIMATION_IMG2 == "images/sm_2.gif";
      ANIMATION_IMG3 == "images/sm_3.gif";
      ANIMATION_IMG4 == "images/sm_4.gif";
      ANIMATION_IMG5 == "images/sm_5.gif";
      ANIMATION_IMG6 == "images/sm_6.gif";
      ANIMATION_IMG7 == "images/sm_7.gif";
      ANIMATION_IMG8 == "images/sm_8.gif";
      ANIMATION_IMG9 == "images/sm_9.gif"; 
      SET_PREF_TIME_OUT == 10000; SET_PREF_CLPFD == TRUE
CONSTANTS Board
PROPERTIES
 Board: DOM*DOM --> 0..9 &
 
 /* set all unused numbers to 0: */
 !(x,y).(x:10..12 & y:1..6 => Board(x,y) = 0 & Board(y,x) = 0) &
 !(x,y).(x:10..12 & y:16..21 => Board(x,y) = 0 & Board(y,x) = 0) 
 
  /* now set up the 5 Sudoku squares : */
    & Sol(7,15,7,15) 
    & Sol(1,9,1,9)
    & Sol(1,9,13,21)  
    & Sol(13,21,1,9) 
    & Sol(13,21,13,21) 
 
  /* Puzzle Constraints  */
  &
  /* top-left square */
  Board(1,1) = 4 & Board(1,4) = 1 & Board(1,6) = 3 & Board(1,9) = 2 &
  Board(2,2) = 9 & Board(2,8) = 6 &
  Board(3,4) = 7 & Board(3,6) = 5 &
  Board(4,1) = 9 & Board(4,3) = 1 & Board(4,5) = 5 & Board(4,7) = 8 & Board(4,9) = 6 &
  Board(5,4) = 6 & Board(5,6) = 7 &
  Board(6,1) = 6 & Board(6,3) = 2 & Board(6,5) = 8 & Board(6,7) = 7 & Board(6,9) = 3 &
  Board(7,4) = 9 & Board(7,6) = 1 & 
  Board(8,2) = 4 &
  Board(9,1) = 8 & Board(9,4) = 2 & Board(9,6) = 6
  &
  /* remaining bits of middle square */
  Board(7,10) = 1 & Board(7,12) = 4 &
  Board(9,10) = 5 & Board(9,12) = 8
  &
  /* top-right square */
  Board(1,13) = 1 & Board(1,16) = 9 & Board(1,18)=8 & Board(1,21) = 6 &
  Board(2,14) = 9 & Board(2,20) = 3 &
  Board(3,16) = 4 & Board(3,18) = 6 &
  Board(4,13) = 8 & Board(4,15) = 6 & Board(4,17) = 9 & Board(4,19) = 5 & Board(4,21)=2 &
  Board(5,16) = 6 & Board(5,18) = 2 &
  Board(6,13) = 4 & Board(6,15) = 9 & Board(6,17) = 7 & Board(6,19) = 3 & Board(6,21)=8
  
  /* currently solved in about 5.6 seconds */
  /* to do: add more of the constraints from Roscoe's slides http://www.iist.unu.edu/atva09/fdrslides.pdf */


END

