MACHINE TestCartProduct
/* generates time-out; with Kodkod it works */
SETS
 A;B;C
CONSTANTS S,R,W,  w1, d1 
PROPERTIES
  S <: A*B & R <: B*C &
  W <: (S)*(R) &
  w1 |-> d1 : W 
 /* & w1 : S & d1 : R */ /* with this it works */

 & card(A)=3 & card(B)=3 & card(C)=2
END

