MACHINE NQueensVariation
DEFINITIONS
 SET_PREF_KODKOD == FALSE;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & r=q(c) & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
CONSTANTS q,n
PROPERTIES
 q:1..n >->> 1..n & !(i,j).(i:1..n & j:2..n & j>i => q(i)+j-1 /= q(j) & q(i)-j+1 /= q(j)) & n=7
END

