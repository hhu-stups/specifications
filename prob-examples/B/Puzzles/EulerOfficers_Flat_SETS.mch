MACHINE EulerOfficers_Flat_SETS
/* Flatter encoding for use with Kodkod; using SETS */
/* An encoding of the Officers problem (http://en.wikipedia.org/wiki/Thirty-six_officers_problem) */
/*
The thirty-six officers problem is a mathematical puzzle proposed by Leonhard Euler in 1782.[1][2]

The problem asks if it is possible to arrange six regiments consisting of six officers each of different ranks in a 6 × 6 square so that no rank or regiment will be repeated in any row or column. Such an arrangement would form a Graeco-Latin square. Euler correctly conjectured there was no solution to this problem, and Gaston Tarry proved this in 1901,[3][4] but the problem has led to important work in combinatorics.[5]

Besides the 6 × 6 case the only other case where the equivalent problem has no solution is the 2 × 2 case, i.e. when there are four officers.
*/
SETS
  RANK_COL
DEFINITIONS
 ANIMATION_FUNCTION == {r,c,i|r:RANK_COL & c:RANK_COL & i = (squadron1(r,c),squadron2(r,c))}
CONSTANTS n, squadron1, squadron2, R1
PROPERTIES
 card(RANK_COL) = n &
 n=5 &
       /* 2.8 secs with ProB (without R1 much slower !!! : 66 secs), 
          4.4 secs with Kodkod (6.4 without R1) */
 squadron1: RANK_COL*RANK_COL-->RANK_COL & 
 squadron2: RANK_COL*RANK_COL-->RANK_COL &  
 !x.(x:RANK_COL
       => card({j|j:RANK_COL & #i.(i:RANK_COL & j=(squadron1(x,i)))})=n &
          card({j|j:RANK_COL & #i.(i:RANK_COL & j=(squadron1(i,x)))})=n &
          card({j|j:RANK_COL & #i.(i:RANK_COL & j=(squadron2(x,i)))})=n &
          card({j|j:RANK_COL & #i.(i:RANK_COL & j=(squadron2(i,x)))})=n) &

 /* I am not sure this is required : */
 !(i,j,k,l).((i:RANK_COL & j:RANK_COL & k:RANK_COL & l:RANK_COL & 
              (i,j) /= (k,l))
            =>
             (squadron1(i,j),squadron2(i,j))
              /= (squadron1(k,l),squadron2(k,l))
            ) 
 & R1 : RANK_COL
 & squadron1(R1,R1) = R1 & squadron2(R1,R1) = R1 /* symmetry breaking */
/* & !jj.(jj:2..n => (squadron1(1,jj)) = jj)  further symmetry breaking */

END

