MACHINE DomTypingErr
CONSTANTS a,n,length
PROPERTIES
  n=7 & length = 25 &
 a:1..n --> 0..length &
 a=[0,2,6,7,14,24,25] &
 dom(a) = 1..n
/* Error appears when Analyzing Properties graphically */
ASSERTIONS
 a:1..n --> 0..length 
END

