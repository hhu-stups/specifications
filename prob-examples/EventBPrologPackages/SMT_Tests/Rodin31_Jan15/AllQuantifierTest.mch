MACHINE AllQuantifierTest
SETS
 ID={aa,bb}
CONSTANTS n,n1,q
PROPERTIES
 n=4 & n1 = n-1 &
 q:(0..n1)*(0..n1) --> BOOL &
 !(x,y).(q(x,y) = TRUE  /* this requires the function to be infinite for WD ! */
  => q((x+1) mod n,y) = FALSE)
END

