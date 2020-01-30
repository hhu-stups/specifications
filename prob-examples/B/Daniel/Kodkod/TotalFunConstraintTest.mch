MACHINE TotalFunConstraintTest
/* 
A test from REPL_UNIT_TESTS
To check how Kodkod & ProB can deal with increasing scopes
Mx Kodkod  ProB
10 0.040   0.020 s
15 0.160   0.030 s
20 0.930   0.070 s
22 2.690   0.110 s
25 9.780   0.130 s
27 20.830  0.160 s
30         0.210 s
*/
DEFINITIONS Mx==22
CONSTANTS g
PROPERTIES
 g : 1 .. Mx --> 1 .. Mx &
 !(x,y).((x : 1 .. Mx & y : 2 .. Mx) & y > x => g(x) /= g(y)) &
 !(x).(x : 1 .. Mx => g(x) /= x) &
  dom(g~) = 1 .. Mx

/* 
& 
  ran(g) = 1 .. Mx & 
  g(1) /= 2 &
  g(1) > 7 &
  g(1) < g(2)  */ /* these four make Kodkod slightly faster; ProB slightly slower */

/* &
  SIGMA(x).(x : 1 .. 5|g(x)) = 40 */  /* SIGMA: cannot yet be translated to Kodkod */
END

