MACHINE PartitionIntoComponentsTest
DEFINITIONS
 D == 1..8;
 CONSTR(a0,b0,c0,d0,e0,f0,g0) == ( a0:D & b0:D & c0:D & d0:D & e0:D & f0:D & g0:D &
  card({a0,b0,c0,d0,e0,f0,g0}) = 7 &
  a0+b0+c0+d0 = e0+f0+g0 &
  a0 < b0 & b0 < c0 & c0 < d0 &
  e0 < f0 & f0 < g0 & g0=f0+1 & f0 = e0+2 & d0>g0 & d0=c0+3  & b0=a0+2
)
CONSTANTS a,b,c,d,e,f,g,  a1,b1,c1,d1,e1,f1,g1, a2,b2,c2,d2,e2,f2,g2, a3,b3,c3,d3,e3,f3,g3,
          a4,b4,c4,d4,e4,f4,g4, a5,b5,c5,d5,e5,f5,g5
PROPERTIES

  CONSTR(a,b,c,d,e,f,g) &
  CONSTR(a1,b1,c1,d1,e1,f1,g1) &
  CONSTR(a2,b2,c2,d2,e2,f2,g2) &
  CONSTR(a3,b3,c3,d3,e3,f3,g3) &
  CONSTR(a4,b4,c4,d4,e4,f4,g4) &
  CONSTR(a5,b5,c5,d5,e5,f5,g5)


OPERATIONS
  aa,bb,cc,dd,ee,ff,gg <-- GetSol = BEGIN aa,bb,cc,dd,ee,ff,gg := a,b,c,d,e,f,g END;
  aa,bb,cc,dd,ee,ff,gg <-- GetSol5 = BEGIN aa,bb,cc,dd,ee,ff,gg := a5,b5,c5,d5,e5,f5,g5 END
END

