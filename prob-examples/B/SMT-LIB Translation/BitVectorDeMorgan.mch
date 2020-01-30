MACHINE BitVectorDeMorgan
DEFINITIONS
 bvand(s,t) == {i,r | r:{0,1} & i:0..max(dom(s)) & ((s(i) = 1 & t(i) = 1 & r=1) or ((s(i) = 0 or t(i)=0) & r=0))};
 bvor(s,t) == {i,r |  r:{0,1} & i:0..max(dom(s)) & ((s(i) = 1 & r=1) or (s(i) = 0 & r=t(i)))};
 bvnot(s) == {i,r | r:{0,1} & i:0..max(dom(s)) & ((s(i) = 1 & r=0) or (s(i) = 0 & r=1))};
 width == 8;
 bvtype == 0..width-1 --> {0,1}
OPERATIONS
  DeMorganCounterExample(x,y) =
	PRE 	x:bvtype & y:bvtype 
		& not(bvand(bvnot(x),bvnot(y)) = bvnot(bvor(x,y)))
	THEN skip END 
END

