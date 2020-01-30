MACHINE BitVectorArithmetic
DEFINITIONS
 bvand(s,t) == {i,r | r:{0,1} & i:0..max(dom(s)) & ((s(i) = 1 & t(i) = 1 & r=1) or ((s(i) = 0 or t(i)=0) & r=0))};
 bvor(s,t) == {i,r |  r:{0,1} & i:0..max(dom(s)) & ((s(i) = 1 & r=1) or (s(i) = 0 & r=t(i)))};
 bvnot(s) == {i,r | r:{0,1} & i:0..max(dom(s)) & ((s(i) = 1 & r=0) or (s(i) = 0 & r=1))};
 width == 3;
 bvtype == 0..width-1 --> {0,1};
 
 nat2bv(val,length) == {i,r | i:0..length-1 & r=(val / 2**i) mod 2};
 bv2nat(bv) == SIGMA(i,r).((i,r) : bv | r * 2**i)
VARIABLES
  x,y
INVARIANT
  x : bvtype & y : bvtype
INITIALISATION
  x := nat2bv(2,width) || y := nat2bv(7,width)
OPERATIONS
  xr,yr <-- tonat = BEGIN xr,yr:=bv2nat(x),bv2nat(y) END 
END