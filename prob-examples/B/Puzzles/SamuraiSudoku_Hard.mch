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
  
  /* currently solved in about 6 seconds using ProB;
     FDR2 takes about 10 minutes (private communication by Roscoe, Sept. 6th 2012) */
  /* cf also Roscoe's slides http://www.iist.unu.edu/atva09/fdrslides.pdf */
  
  &
  Board(1,1) = 4 & Board(4,1) = 1 & Board(9,1) = 2 & Board(13,1) = 1 & 
Board(16,1) = 9 & Board(21,1) = 6 & 
Board(2,2) = 9 & Board(8,2) = 6 & Board(14,2) = 9 & Board(20,2) = 3 & 
Board(4,3) = 7 & Board(6,3) = 5 & Board(18,3) = 6 & 
Board(1,4) = 9 & Board(3,4) = 1 & Board(5,4) = 5 & 
Board(7,4) = 8 & Board(9,4) = 6 & Board(13,4) = 8 & 
Board(15,4) = 6 & Board(17,4) = 9 & Board(19,4) = 5 & Board(21,4) = 2 & 
Board(4,5) = 6 & Board(18,5) = 2 & 
Board(3,6) = 2 & Board(5,6) = 8 & Board(7,6) = 7 & Board(13,6) = 4 & 
Board(15,6) = 9 & Board(17,6) = 7 & Board(19,6) = 3 & 
Board(4,7) = 9 & Board(6,7) = 1 & Board(10,7) = 1 & Board(12,7) = 4 & Board(16,7) = 5 & 
Board(2,8) = 4 & Board(20,8) = 7 & 
Board(1,9) = 8 & Board(4,9) = 2 & Board(6,9) = 6 & Board(10,9) = 5 & 
Board(12,9) = 8 & Board(16,9) = 8 & Board(18,9) = 3 & Board(21,9) = 4 & 
Board(7,10) = 5 & Board(9,10) = 7 & Board(11,10) = 8 & Board(13,10) = 1 & 
Board(15,10) = 2 & 
Board(10,11) = 2 & Board(12,11) = 5 & 
Board(9,12) = 9 & Board(13,12) = 3 & Board(15,12) = 4 & 
Board(1,13) = 1 & Board(4,13) = 7 & Board(10,13) = 3 & Board(12,13) = 1 & 
Board(16,13) = 2 & Board(18,13) = 3 & Board(21,13) = 6 & 
Board(2,14) = 2 & Board(20,14) = 8 & 
Board(4,15) = 5 & Board(6,15) = 3 & Board(10,15) = 7 & Board(12,15) = 6 & 
Board(16,15) = 6 & Board(18,15) = 4 & 
Board(1,16) = 5 & Board(3,16) = 2 & Board(5,16) = 7 & Board(7,16) = 3 & 
Board(9,16) = 8 & Board(13,16) = 1 & Board(17,16) = 4 & Board(19,16) = 5 & 
Board(21,16) = 2 & 
Board(4,17) = 4 & Board(6,17) = 8 & Board(16,17) = 9 & Board(18,17) = 2 & 
Board(1,18) = 4 & Board(3,18) = 7 & Board(7,18) = 1 & Board(9,18) = 9 & 
Board(13,18) = 2 & Board(15,18) = 7 & Board(17,18) = 6 & Board(19,18) = 9 & 
Board(21,18) = 3 & 
Board(4,19) = 6 & Board(6,19) = 5 & Board(16,19) = 1 & 
Board(2,20) = 9 & Board(20,20) = 3 & 
Board(1,21) = 7 & Board(4,21) = 8 & Board(6,21) = 1 & Board(9,21) = 3 & 
Board(13,21) = 3 & Board(16,21) = 4 & Board(18,21) = 9 & Board(21,21) = 8 
  
 /*
Here the original puzzle from Roscoe's file samurai.csp:

puzzle' = 
<<4,0,0,1,0,0,0,0,2,      1,0,0,9,0,0,0,0,6>,
 <0,9,0,0,0,0,0,6,0,      0,9,0,0,0,0,0,3,0>,
 <0,0,0,7,0,5,0,0,0,      0,0,0,0,0,6,0,0,0>,
 <9,0,1,0,5,0,8,0,6,      8,0,6,0,9,0,5,0,2>,
 <0,0,0,6,0,0,0,0,0,      0,0,0,0,0,2,0,0,0>,
 <0,0,2,0,8,0,7,0,0,      4,0,9,0,7,0,3,0,0>,
 <0,0,0,9,0,1,0,0,0,1,0,4,0,0,0,5,0,0,0,0,0>,
 <0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7,0>,
 <8,0,0,2,0,6,0,0,0,5,0,8,0,0,0,8,0,3,0,0,4>,
             <5,0,7,0,8,0,1,0,2>,
             <0,0,0,2,0,5,0,0,0>,
             <0,0,9,0,0,0,3,0,4>,
 <1,0,0,7,0,0,0,0,0,3,0,1,0,0,0,2,0,3,0,0,6>,
 <0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0>,
 <0,0,0,5,0,3,0,0,0,7,0,6,0,0,0,6,0,4,0,0,0>,
 <5,0,2,0,7,0,3,0,8,      1,0,0,0,4,0,5,0,2>,
 <0,0,0,4,0,8,0,0,0,      0,0,0,9,0,2,0,0,0>,
 <4,0,7,0,0,0,1,0,9,      2,0,7,0,6,0,9,0,3>,
 <0,0,0,6,0,5,0,0,0,      0,0,0,1,0,0,0,0,0>,
 <0,9,0,0,0,0,0,0,0,      0,0,0,0,0,0,0,3,0>,
 <7,0,0,8,0,1,0,0,3,      3,0,0,4,0,9,0,0,8>>

*/
END

