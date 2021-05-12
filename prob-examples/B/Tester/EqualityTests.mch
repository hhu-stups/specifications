MACHINE EqualityTests
ABSTRACT_CONSTANTS f,g,
  f1,g1,g2
PROPERTIES
  f = %x.(x:1..3| {y|y>x}) &
  g = %y.(y:1..3| {z|z>=y+1}) &
  f1 = /*@symbolic */ %x.(x:1..3| {y|y>x & y<100}) &
  g1 = /*@symbolic */ %y.(y:1..3| {z|z>=y+1 & z<100}) &
  g2 = /*@symbolic */ %y.(y:1..3| {z|z>=y+1 & z<101})

ASSERTIONS
 f=g;
 f1=g1
END
