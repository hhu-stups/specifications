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
  SET_PREF_CLPFD == TRUE; SET_PREF_TIME_OUT == 120000; SET_PREF_MEMO == TRUE; 

  /* domain of discourse and observations of agents */
  Pairs == {xx,yy| 1 < xx & xx <= yy & yy < 100} ;
  obs_s(x0,y0) == x0+y0 ;
  obs_p(x1,y1) == x1*y1 ;
  /* set of pairs among set W that yield given observation (for S or P) */
  possible_s(W0,s) == {x2,y2| (x2,y2) : W0 & obs_s(x2,y2) = s} ;
  possible_p(W1,p) == {x3,y3| (x3,y3) : W1 & obs_p(x3,y3) = p} ;
  /* agent knows F at world w:W iff F holds at all equivalent worlds in W */
  knows_p(W2,F) == {x4,y4| (x4,y4) : W2 & possible_p(W2,obs_p(x4,y4)) <: F} ;
  knows_s(W3,G) == {x5,y5| (x5,y5) : W3 & possible_s(W3,obs_s(x5,y5)) <: G} ;
  /* agent knows ~F if F holds at no equivalent world */
  knows_p_not(W4,FF) == {x6,y6| (x6,y6) : W4 & possible_p(W4,obs_p(x6,y6)) /\ FF = {}} ;
  knows_s_not(W5,GG) == {x7,y7| (x7,y7) : W5 & possible_s(W5,obs_s(x7,y7)) /\ GG = {}} ;
  /* agent knows solution if the equivalence class is a singleton */
  knows_p_solution(W6) == {x8,y8| (x8,y8) : W6 & possible_p(W6, obs_p(x8,y8)) <: {(x8,y8)}} ;
  /* marginally faster: knows_p_solution(W6) == {x8,y8| (x8,y8) : W6 & card(possible_p(W6, obs_p(x8,y8)))=1} ; */
  knows_s_solution(W7) == {x9,y9| (x9,y9) : W7 & possible_s(W7, obs_s(x9,y9)) <: {(x9,y9)}} ;

  step2 == knows_s_not(Pairs, knows_p_solution(Pairs)) ;
  step3 == knows_p_solution(step2) ;
  step4 == knows_s_solution(step3) ;

CONSTANTS x, y

PROPERTIES
  (x,y) : step4

/* takes around 10 seconds on a MacBook Air (1.7 GHz Intel Core i5, 4GB Memory) */
END