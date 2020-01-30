MACHINE SMT_PredReuseTest
SETS
 ID={aa,bb}
CONSTANTS a,b,c,x,y,z
PROPERTIES
 x:0..2 & y:1..2 & z:0..1 &
 ((a=TRUE & x>y & y>z & x>1 & c:{aa} & a=b)
  or
  (a=FALSE & x<=y & z=0 & y>1 & c:{aa} & a/=b )
  or
  (x>y & y>z & b=TRUE & c/:{aa}  & a/=b )
  or
  (x<=y & y>z & b=FALSE  & a/=b & c:{aa})
  )
END

