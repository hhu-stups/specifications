MACHINE EulerOfficers_Flat
/* Flatter encoding for use with Kodkod */
/* An encoding of the Officers problem (http://en.wikipedia.org/wiki/Thirty-six_officers_problem) */
/*
The thirty-six officers problem is a mathematical puzzle proposed by Leonhard Euler in 1782.[1][2]

The problem asks if it is possible to arrange six regiments consisting of six officers each of different ranks in a 6 × 6 square so that no rank or regiment will be repeated in any row or column. Such an arrangement would form a Graeco-Latin square. Euler correctly conjectured there was no solution to this problem, and Gaston Tarry proved this in 1901,[3][4] but the problem has led to important work in combinatorics.[5]

Besides the 6 × 6 case the only other case where the equivalent problem has no solution is the 2 × 2 case, i.e. when there are four officers.
*/
DEFINITIONS
 ANIMATION_FUNCTION == {r,c,i|r:1..n & c:1..n & i = (squadron1(r,c),squadron2(r,c))}
CONSTANTS n, squadron1, squadron2
PROPERTIES
 n=5 & /* solution found for n=5: 1.52 secs with full symmetry breaking - 9.5 secs with Kodkod (12 secs with additional Officers set); no change for ProB */
 squadron1: (1..n)*(1..n)-->1..n & 
 squadron2: (1..n)*(1..n)-->1..n &  
 !x.(x:1..n
       => card({j|j:1..n & #i.(i:1..n & j=(squadron1(x,i)))})=n &
          card({j|j:1..n & #i.(i:1..n & j=(squadron1(i,x)))})=n &
          card({j|j:1..n & #i.(i:1..n & j=(squadron2(x,i)))})=n &
          card({j|j:1..n & #i.(i:1..n & j=(squadron2(i,x)))})=n) &

 /* I am not sure this is required : */
 !(i,j,k,l).((i:1..n & j:1..n & k:1..n & l:1..n & i <= k &
             (i<k or (i=k & j<l)))
            =>
             (squadron1(i,j),squadron2(i,j))
              /= (squadron1(k,l),squadron2(k,l))  /* ProB slower with or of two /= */
            ) 
 & squadron1(1,1) = 1 & squadron2(1,1) = 1 /* symmetry breaking */
 & !jj.(jj:2..n => (squadron1(1,jj)) = jj) /* further symmetry breaking */

END

