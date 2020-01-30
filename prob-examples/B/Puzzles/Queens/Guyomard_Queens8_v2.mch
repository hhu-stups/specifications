MACHINE Guyomard_Queens8_v2
/* encoding from bottom of page 17 of book:
  Structures de données et méthodes formelles
  Guyomard, Marc
  1st Edition., 2011, XVI, 439 p.
  http://www.springer.com/computer/book/978-2-8178-0199-5
*/
DEFINITIONS
      n==8;
      SET_PREF_CLPFD == TRUE;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & r=q(c) & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
CONSTANTS q
PROPERTIES
 q: 1..8 >-> 1..8 &
 %i.(i:1..8 | i+q(i)) : 1..8 >-> 2..16 &
 %i.(i:1..8 | i-q(i)) : 1..8 >-> -7..7
END

