MACHINE QueensBoardVersion_v2
/*
 simplified version of problem
 Kodkod fails to find a solution even though there is one
*/
CONSTANTS board
PROPERTIES 
 board <: (1..2) * (1..2) /* board contains coordinates of all queens */
 &
 board /= {}
 &
 !(p,q).((p:1..2 & q:1..2 & (p,q):board )
 //        (p,q):board
     => 
     (p+1,q) /: board & (p+2,q) /: board
        )

/*

problem p24 2250 0 sat4j
((inttype(p2i 0 4)(is 0 2)))
((id549 subset is is))
(and(
not(equals(relref id549)(product(empty)(empty))))
(in(relref id549)
(product(comp((v550 1 one(relref is)))
(and(lte(1)(expr2int(varref v550)))
(lte(expr2int(varref v550))(2))))(comp((v551 1 one(relref is)))
(and(lte(1)(expr2int(varref v551)))(lte(expr2int(varref v551))(2))))))
(all((v552 1 one(relref is))(v553 1 one(relref is)))
(implies(and(lte(1)(expr2int(varref v552)))
(lte(expr2int(varref v552))(2))(lte(1)(expr2int(varref v553)))
(lte(expr2int(varref v553))(2))(in(product(varref v552)(varref v553))(relref id549)))
(and(not(in(product(int2intset(add(expr2int(varref v552))(1)))(varref v553))(relref id549)))(
 not(in(product(int2intset(add(expr2int(varref v552))(2)))(varref v553))(relref id549))))))).

*/
DEFINITIONS
   SET_PREF_KODKOD == TRUE;
   SET_PREF_KODKOD_SYMMETRY == 0;
 //     SET_PREF_KODKOD_MAX_NR_SOLS == 1;
 //     SET_PREF_KODKOD_SAT_SOLVER == "sat4j";
 n==2;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i=(r+c) mod 2 }  );
      ANIMATION_FUNCTION == ( {r,c,i|c:1..n & (r,c):board & i=2+((r+c) mod 2) }  );
      ANIMATION_IMG0 == "images/sm_empty_box.gif";
      ANIMATION_IMG1 == "images/sm_gray_box.gif";
      ANIMATION_IMG2 == "images/sm_queen_white.gif";
      ANIMATION_IMG3 == "images/sm_queen_black.gif";
      SET_PREF_MAX_INITIALISATIONS == 10;
      SET_PREF_MAX_OPERATIONS == 10;
END


