MACHINE Guyomard_Queens8_v1
/* encoding from middle of page 17 of book
  Structures de données et méthodes formelles
  Guyomard, Marc
  1st Edition., 2011, XVI, 439 p.
  http://www.springer.com/computer/book/978-2-8178-0199-5
*/
DEFINITIONS SET_PREF_CLPFD == TRUE;
  NrQ == 4;
      ANIMATION_FUNCTION_DEFAULT == ( {rw,c,i|rw:1..NrQ & c:1..NrQ & i=(rw+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {rw,c,i|rw:1..NrQ & c:1..NrQ & r(rw,c)=TRUE & i=2+((rw+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif"
CONSTANTS r
PROPERTIES
 r : ((1..NrQ) * (1..NrQ)) --> BOOL &
 !(i,j).((1 <= i & i <= 8 & 1 <= j & j <= 8 & r(i,j)=TRUE)
   => (
    not(#k.(1 <= k & k <= NrQ & k /= i & r(k,j)=TRUE)) &
    not(#k.(1 <= k & k <= NrQ & k /= j & r(i,k)=TRUE)) &
    not(#(k,l). (1 <= k & k<= NrQ & 1 <= l & l <= NrQ & k /= i & l /= j &
                 k+l = i+j & r(k,l) = TRUE)) &
    not(#(k,l). (1 <= k & k<= NrQ & 1 <= l & l <= NrQ & k /= i & l /= j &
                 k-l = i-j & r(k,l) = TRUE)) 
      )
 )
 &
 !i.((1 <= i & i <= NrQ) => #j.(1 <= j & j <= NrQ & r(i,j) = TRUE)) 
END

