MACHINE QueensRooksBishops
DEFINITIONS n==7 ; nbishops ==11;
      SET_PREF_MAX_INITIALISATIONS == 1;
      SET_PREF_TIME_OUT == 15000;
      SET_PREF_RANDOMISE_ENUMERATION_ORDER == FALSE;
      ANIMATION_FUNCTION_DEFAULT == ( {r,c,i|r:1..n & c:1..n & i="-" }  );
      ANIMATION_FUNCTION1 == {r,c,i|(r,c):bishops & i= "B"} ;
      ANIMATION_FUNCTION2 == {r,c,i|(r,c):queens & i= "Q"} ;
      ANIMATION_FUNCTION3 == {r,c,i|(r,c):rooks & i= "R"} ;

CONSTANTS rooks, queens, bishops
PROPERTIES
 rooks : 1..n >-> 1..n & 
 
 queens(1) : 1..4 & // symmetry breaking
 queens : 1..n >-> 1..n & 
 !(q1,q2).(q1:1..n & q2:2..n & q2>q1 => queens(q1)+(q2-q1) /= queens(q2) & queens(q1)+(q1-q2) /= queens(q2) )
 &
 !i.(i:1..n => rooks(i) /= queens(i) 
  // &  i|->rooks(i)/:bishops 
  // & i|->queens(i)/:bishops
  ) & 
 
 bishops <: (1..n)*(1..n) &  card(bishops)=nbishops &

 !(i).(i:1..n  => 
  !(j).(j:1..n => //{i,j}<:1..n =>
   ((i,j): bishops
    => queens(i)/=j &
      rooks(i) /= j & 
      !k.(k:(i+1)..n => (k,j+k-i) /: bishops & (k,j-k+i) /: bishops )
    ))
  )

// & rooks=[8,6,7,3,4,1,5,2] & queens=[1,5,8,6,3,7,2,4] // with this we can find solution in 12.3 seconds for n=8 and 14 bishops

  /*
 !(ij).( ij: bishops
   => LET i,j BE i=prj1(INTEGER,INTEGER)(ij) & j=prj2(INTEGER,INTEGER)(ij) IN
      queens(i)/=j &
      rooks(i) /= j & 
      !k.(k:(i+1)..n => (k,j+k-i) /: bishops & (k,j-k+i) /: bishops )
      END
  ) */
ASSERTIONS
  !(ij).( ij: bishops
   => LET i,j BE i=prj1(INTEGER,INTEGER)(ij) & j=prj2(INTEGER,INTEGER)(ij) IN
      queens(i)/=j &
      rooks(i) /= j & 
      !k.(k:(i+1)..n => (k,j+k-i) /: bishops & (k,j-k+i) /: bishops )
      END
  )
END

