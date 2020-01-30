MACHINE QueensBoardVersion_v3
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

((1,2):board => ((2,2) /: board & (3,2) /: board )) &
((1,1):board => ((2,1) /: board & (3,1) /: board )) &

((2,1):board => ((3,1) /: board & (4,1) /: board )) &
((2,2):board => ((3,2) /: board & (4,2) /: board ))
/*

problem p34 2250 0 sat4j
((inttype(p2i 0 4)(is 0 2)))((id718 subset is is))
(and(not(equals(relref id718)(product(empty)(empty))))
    (in(relref id718)(product(comp((v719 1 one(relref is)))
(and(lte(1)(expr2int(varref v719)))
     (lte(expr2int(varref v719))(2))))(comp((v720 1 one(relref is)))
(and(lte(1)(expr2int(varref v720)))
     (lte(expr2int(varref v720))(2))))))

(implies(in(product(int2intset(1))(int2intset(2)))(relref id718))
 (and(not(in(product(int2intset(2))(int2intset(2)))(relref id718)))
     (not(in(product(int2intset(3))(int2intset(2)))(relref id718)))))

(implies(in(product(int2intset(1))(int2intset(1)))(relref id718))
 (and(not(in(product(int2intset(2))(int2intset(1)))(relref id718)))
     (not(in(product(int2intset(3))(int2intset(1)))(relref id718)))))

(implies(in(product(int2intset(2))(int2intset(1)))(relref id718))
  (and(not(in(product(int2intset(3))(int2intset(1)))(relref id718)))
      (not(in(product(int2intset(4))(int2intset(1)))(relref id718)))))

(implies(in(product(int2intset(2))(int2intset(2)))(relref id718))
 (and(not(in(product(int2intset(3))(int2intset(2)))(relref id718)))
     (not(in(product(int2intset(4))(int2intset(2)))(relref id718)))))).
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


