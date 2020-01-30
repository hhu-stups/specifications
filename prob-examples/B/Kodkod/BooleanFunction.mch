MACHINE BooleanFunction
SETS
 ID={aa,bb}
CONSTANTS n, bv, bv2,bv3
PROPERTIES
 n = 20 &
 bv : 1..n --> 0..1 &
 bv2 : 1..n --> 0..1 &
 bv3 : 1..n --> 0..1 &
 !i.(i:1..n => bv(i) = bv2(i)+bv3(i)) & // xor
 card({i|i:1..n & bv2(i)=1}) = card({i|i:1..n & bv3(i)=1}) &
 bv : 1..n --> 1..1
END

