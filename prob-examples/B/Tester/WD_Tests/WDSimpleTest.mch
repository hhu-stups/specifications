MACHINE WDSimpleTest
CONSTANTS a,n
PROPERTIES
  n:NATURAL &
  a:1..n --> 1..10 & card(a)>0 & a/= {} &
  a(1) = 1 &
  a(n) = max(ran(a))
END
