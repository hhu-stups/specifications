MACHINE SubsetReificationTest
SETS
 ID={aa,bb,cc,dd,ee,ff,gg}
CONSTANTS s,n,f
PROPERTIES
  n = 10 &
  s: 1..n --> POW(ID) &
  f: 1..n --> 1..n &
  !(i,j).(i:1..n & j:2..n & i<j => (s(i) <: s(j) <=> f(i) < f(j))) &
  f(5) < f(6)
END

