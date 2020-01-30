MACHINE SumAndProduct
/*
(****************************************************************************)
(* This module formalizes the "sum and product" puzzle, due to Freudenthal  *)
(* (1969), and which goes as follows:                                       *)
(* J says to S and P: I have chosen two integers x and y such that          *)
(* 1 < x <= y < 100. In a moment, I will inform S only of the sum x+y       *)
(* and P only of the product x*y. These announcements remain private.       *)
(* You are required to determine the pair (x,y). He acts as said.           *)
(* The following conversation now takes place:                              *)
(* 1. P says: "I don't know it."                                            *)
(* 2. S says: "I knew you didn't."                                          *)
(* 3. P says: "Now I know it."                                              *)
(* 4. S says: "I now also know it."                                         *)
(* Determine the pair (x,y).                                                *)
(*                                                                          *)
*/
DEFINITIONS 
  SET_PREF_CLPFD == TRUE; SET_PREF_TIME_OUT == 12000;
  InRange(xx,yy) == 1 < xx & xx <= yy & yy < 100 ;
  p_not_knows_xy(x,y) == #(x2,y2).(InRange(x2,y2) & x2+y2=x+y & (x,y) /= (x2,y2));
  sum_possible(s) == {xx,yy| InRange(xx,yy) & xx+yy=s};
  product_possible(p) == {xx,yy| InRange(xx,yy) & xx*yy=p}
CONSTANTS x,y, p_knows, s_knows_p_didnt, p_now_knows_it
PROPERTIES
  p_knows = {x1,y1 | InRange(x1,y1) & !(x2,y2).((InRange(x2,y2) & x2*y2=x1*y1) => (x2=x1 & y2=y1)) } &
  
  InRange(x,y) &

  /* 1. P says I dont know it : */ 
  (x,y) /: p_knows /* p_not_knows_xy(x,y) & */
  
  &
  
  /* 2. S says: I knew you didn't */
  s_knows_p_didnt = {xs,ys | InRange(xs,ys) & sum_possible(xs+ys) /\ p_knows = {}} &
  (x,y) : s_knows_p_didnt
  
  &

 /* 3. P says: "Now I know it." */  
  p_now_knows_it = {xp,yp| InRange(xp,yp) & (xp,yp) /: p_knows &
                            card(product_possible(xp*yp) /\ s_knows_p_didnt)=1} &
  (x,y) : p_now_knows_it
  
  & 
 /*  4. S says: "I now also know it." */

  card(sum_possible(x+y) /\ p_now_knows_it)=1

/* Unique solution found (and identified as unique) after 8.4-8.7 seconds on MacBook Air 11" 1.8GhZ i7:
  x=4 & y=13
*/
END

