MACHINE VietnamSnakePuzzle
/* 
  Guardian Puzzle: http://www.theguardian.com/science/alexs-adventures-in-numberland/2015/may/20/can-you-do-the-maths-puzzle-for-vietnamese-eight-year-olds-that-has-stumped-parents-and-teachers?CMP=share_btn_tw

 Eclipse CLP solution: http://sdymchenko.com/blog/2015/05/29/snake-puzzle-eclipse/
*/
CONSTANTS A,B,C,D,E,F,G,H,I
PROPERTIES
  /* The puzzle asks to fill empty cells with integer numbers 1..9 */
  {A,B,C,D,E,F,G,H,I} <: 1..9 &
  
  /* using every number only once */
  card({A,B,C,D,E,F,G,H,I}) = 9 &

 /* such that the equality holds (order of operations: multiply and divide first, then add and subtract; colon : represents division). */
    A + (13 * B) / C +
    D + 12 * E - F - 11 +
    G * H / I - 10 = 66 
  &
 /* ensure divisions have no remainder */
  (G*H) mod I = 0 & 
  (13*B) mod C = 0

 /* ProB finds 20 solutions very quickly (first solution 10 ms); Kodkod 1.6-2.6 seconds on MacPro */
DEFINITIONS
 SET_PREF_MAX_INITIALISATIONS == 21
END

