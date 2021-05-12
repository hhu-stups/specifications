MACHINE ArithmeticExpLaws
// some specific laws about exponentiation
// kept separate from other laws because of CLP(FD) overflow issues
// and thus using smaller ranges for x,y,z
DEFINITIONS
 MAX_x == 50;
 MAX_y == 9;
 MAX_z == 4;
 MIN_x == -2;
 MIN_y == 0;
 MIN_z == 0
VARIABLES x,y,z
INVARIANT
 x:INTEGER & y:INTEGER & z:INTEGER &

 x**2 = x*x &
 (x>=0 => 1**x = 1) &
 (x>0 => 2**x = 2*(2**(x-1))) &
 (x>0 => 2**(10*x) = 2*(2**(10*x-1))) &
 (x>0 => 3**(10*x) = 3*(3**(10*x-1))) &

 x**3 = x*x*x &
 (z>0 => x**z = x*(x**(z-1))) &
 {v|v:0..(MAX_y**MAX_z) & y**z=v} = {y**z} &
 (y>1 => card({v|v:0..MAX_z & y**v:1..(y**z)}) = z+1) &
 ((y>1 & z>0) => card({v|v:1..MAX_y & v**z:1..(y**z)}) = y) &
 card({xx|xx:1..x & card({a,b|a:1..MAX_y & b:2..MAX_z & a**b=xx})=2}) < 2
ASSERTIONS
 {xx|xx:1..81 & card({a,b|a:1..MAX_y & b:2..MAX_z & a**b=xx})=2} = {16,64,81}
INITIALISATION x,y,z := MIN_x,MIN_y,MIN_z
OPERATIONS
  IncX = PRE x<MAX_x THEN x := x+1 END;
  IncY = PRE y<MAX_y THEN y := y+1 END;
  IncZ = PRE z<MAX_z THEN z := z+1 END /* ;
  AddToZ(a) = PRE a:NATURAL THEN z := z+a END */
END

