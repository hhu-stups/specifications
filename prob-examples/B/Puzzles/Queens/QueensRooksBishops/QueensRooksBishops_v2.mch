MACHINE QueensRooksBishops_v2
 // uses has_bishop total function
DEFINITIONS n==7 ; NBSHP==12;
      SET_PREF_MAX_INITIALISATIONS == 1;
      SET_PREF_TIME_OUT == 5000;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i="-" }  );
      ANIMATION_FUNCTION1 == {r,c,i|(r,c)|->TRUE:hasbishop & i= "B"} ;
      ANIMATION_FUNCTION2 == {r,c,i|(r,c):queens & i= "Q"} ;
      ANIMATION_FUNCTION3 == {r,c,i|(r,c):rooks & i= "R"} ;

CONSTANTS rooks, queens, hasbishop, nbishops
PROPERTIES
 rooks : 1..n >-> 1..n & 
 
 queens(1) : 1..4 & // symmetry breaking
 queens : 1..n >-> 1..n & 
 !(q1,q2).(q1:1..n & q2:2..n & q2>q1
    => queens(q1)+(q2-q1) /= queens(q2) &
       queens(q1)+(q1-q2) /= queens(q2) )
 &
 !i.(i:1..n => rooks(i) /= queens(i) 
   &  hasbishop(i|->rooks(i))=FALSE
   &  hasbishop(i|->queens(i))=FALSE
  ) & 
 
 hasbishop : (1..n)*(1..n) --> BOOL & // Kodkod does not support this as a function
 
 !(i).(i:1..n 
  =>
  !(j).(j:1..n
    =>
    ( hasbishop((i,j))=TRUE
       =>
        queens(i)/=j & 
        rooks(i) /= j &
        (!k.(k:(i+1)..n => 
           (j+k-i:1..n => hasbishop((k,j+k-i)) = FALSE) &
           (j-k+i:1..n => hasbishop((k,j-k+i)) = FALSE)
        ))
    ))
   )
// & nqueens = card({i| i:dom(hasbishop) & hasbishop(i)=TRUE})
 & nbishops = card({i,j| i:1..n & j:1..n & hasbishop((i,j))=TRUE})
 & nbishops = NBSHP // n=8 10: 430 ms; 14: 567 seconds to find solution;  n=7, with 12 bishops: 32 seconds

/*
rooks=[8,6,7,3,4,1,5,2] &
       queens=[1,5,8,6,3,7,2,4] &
       hasbishop=#64:{((1|->1)|->FALSE),((1|->2)|->FALSE),...,((8|->7)|->FALSE),((8|->8)|->TRUE)} &
       nbishops=14 )
*/
END

