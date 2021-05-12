MACHINE NestedProperties
SETS
 ID={aa,bb}
DEFINITIONS SET_PREF_OPTIMIZE_AST == FALSE
CONSTANTS iv, x,y,z, f
PROPERTIES
 iv:ID &
 x:1..100 &
 y:2..44 &
 z: 3..55 &
 x>z &
 (y>z => z>33 or x<33) &
 ( (x=2 & y=3 & z=4) or
   (x=3 & y=5 & z=11) or
   (x>1 => z<10)
 ) &
 not( x=3 & y=4 <=> z=4 & z=5) &
 not (λx·(x∈1‥z∣x+1)(3) = 3) &
  prj1(INTEGER,INTEGER)(prj1(INTEGER*INTEGER,INTEGER) (prj1(INTEGER*INTEGER*INTEGER,INTEGER) (prj1(INTEGER*INTEGER*INTEGER*INTEGER,INTEGER) ((1,2,3,4,5))))) = 1
 &
 prj1(POW(INTEGER),INTEGER)({1}|->2) = {1}
 &
 (f = %(x,y).(x:INTEGER&y:INTEGER|x+y) &
  f(2,3) = 5)
  &
 #(v,w,u).(v:BOOL & w:BOOL & u:BOOL & (v=w <=> v=u))
  &
 #(v,w,u).(v:BOOL & w:BOOL & u:BOOL & (v=TRUE & w=FALSE & (v=u <=> w/=u)))
  &
  #(v,w).(v=x+y+z & w=x-y+z & v>5 & v<200 & v>w & w>0)
END

