MACHINE EulerOfficers6 /* cannot be solved at the moment */
/* An encoding of the Officers problem (http://en.wikipedia.org/wiki/Thirty-six_officers_problem) */
/*
The thirty-six officers problem is a mathematical puzzle proposed by Leonhard Euler in 1782.[1][2]

The problem asks if it is possible to arrange six regiments consisting of six officers each of different ranks in a 6 × 6 square so that no rank or regiment will be repeated in any row or column. Such an arrangement would form a Graeco-Latin square. Euler correctly conjectured there was no solution to this problem, and Gaston Tarry proved this in 1901,[3][4] but the problem has led to important work in combinatorics.[5]

Besides the 6 × 6 case the only other case where the equivalent problem has no solution is the 2 × 2 case, i.e. when there are four officers.
*/
DEFINITIONS
 ANIMATION_FUNCTION == {r,c,i|r:1..n & c:1..n & i = squadron(r,c)};
 p1(xx) == prj1(INTEGER,INTEGER)(xx);
 p2(xx) == prj2(INTEGER,INTEGER)(xx);
 COMP == {i,j,k,l| i:1..n & j:1..n & k:1..n & l:1..n & i <= k & (i<k or i=k & j<l)};
  ALLDIFF1(ii) == (card({p1(squadron(ii,1)),p1(squadron(ii,2)),p1(squadron(ii,3)),
                         p1(squadron(ii,4)),p1(squadron(ii,5)),p1(squadron(ii,6))}) = 6);
  ALLDIFF2(ii) == (card({p2(squadron(ii,1)),p2(squadron(ii,2)),p2(squadron(ii,3)),
                         p2(squadron(ii,4)),p2(squadron(ii,5)),p2(squadron(ii,6))}) = 6);
  ALLDIFF3(ii) == (card({p1(squadron(1,ii)),p1(squadron(2,ii)),p1(squadron(3,ii)),
                         p1(squadron(4,ii)),p1(squadron(5,ii)),p1(squadron(6,ii))}) = 6);
  ALLDIFF4(ii) == (card({p2(squadron(1,ii)),p2(squadron(2,ii)),p2(squadron(3,ii)),
                         p2(squadron(4,ii)),p2(squadron(5,ii)),p2(squadron(6,ii))}) = 6);
  ALLDIFFS == ALLDIFF1(1) & ALLDIFF1(2) & ALLDIFF1(3) & ALLDIFF1(4) & ALLDIFF1(5) &
 ALLDIFF2(1) & ALLDIFF2(2) & ALLDIFF2(3) & ALLDIFF2(4) & ALLDIFF2(5) &
 ALLDIFF3(1) & ALLDIFF3(2) & ALLDIFF3(3) & ALLDIFF3(4) & ALLDIFF3(5) &
 ALLDIFF4(1) & ALLDIFF4(2) & ALLDIFF4(3) & ALLDIFF4(4) & ALLDIFF4(5) ;
 
 ALLDIFFS_SET == 
 !x.(x:1..n
       => card({j|j:1..n & #i.(i:1..n & j=p1(squadron(x,i)))})=n &  /* without j:1..n  closure reification does not work */
          card({j|j:1..n & #i.(i:1..n & j=p1(squadron(i,x)))})=n &
          card({j|j:1..n & #i.(i:1..n & j=p2(squadron(x,i)))})=n &
          card({j|j:1..n & #i.(i:1..n & j=p2(squadron(i,x)))})=n) ;
 
 ALLDIFFS_SET2 == 
 !x.(x:1..n
       => UNION(i).(i:1..n|{p1(squadron(x,i))}) = 1..n &
          UNION(i).(i:1..n|{p2(squadron(x,i))}) = 1..n &
          UNION(i).(i:1..n|{p1(squadron(i,x))}) = 1..n &
          UNION(i).(i:1..n|{p2(squadron(i,x))}) = 1..n) 
CONSTANTS n, Officers, squadron
PROPERTIES
 n=6 & 
 Officers = (1..n)*(1..n) &
 squadron: (1..n)*(1..n)-->Officers &  /* using -->> slows things down */
 

 ALLDIFFS &
 /* I am not sure this is required : */
 !(i,j,k,l).((i:1..n & j:1..n & k:1..n & l:1..n & i <= k &
             (i<k or (i=k & j<l)))
            =>
             squadron(i,j) /= squadron(k,l)
            ) 
 & squadron(1,1) = (1,1) /* symmetry breaking */
 & !jj.(jj:2..n => p1(squadron(1,jj)) = jj) /* further symmetry breaking */
ASSERTIONS
 ran(squadron) = Officers 
END

