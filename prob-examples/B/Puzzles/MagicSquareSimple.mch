MACHINE MagicSquareSimple
/* Another Version: using Constants & Properties */
DEFINITIONS
 sm(x,y,z) == (x+y+z = magic_sum);
 SET_PREF_MAX_INITIALISATIONS == 30;
 ANIMATION_FUNCTION == ( {r,c,i|r:1..3 & c:1..3 & i=square(r|->c)}  );
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
      ANIMATION_IMG10 == "images/sm_10.gif";
      ANIMATION_IMG11 == "images/sm_11.gif"
CONSTANTS magic_sum, square
PROPERTIES
  magic_sum = 18 &
  square : ((1..3) * (1..3)) >-> 1..magic_sum & /* 18^9 = 198,359,290,368 possibilities */
  !i.(i:1..3 => sm(square(1|->i),square(2|->i),square(3|->i))) & /* Row Sums */
  !j.(j:1..3 => sm(square(j|->1),square(j|->2),square(j|->3))) & /* Column Sums */
  sm( square(1|->1), square(2|->2), square(3|->3) ) & /* Diagonal 1 Sum */
  sm( square(1|->3), square(2|->2), square(3|->1) ) /* Diagonal 2 Sum */
  
 /* !(i,j,k,l).(i:1..3 & j:1..3 & k:1..3 & l:1..3 & (i,j) /= (k,l) =>
                 square(i|->j) /= square(k|->l) ) */ /* all different; already specified by using an injection >-> */
OPERATIONS
  r <-- Get(yy) = PRE yy:dom(square) THEN r:= square(yy) END
END

