MACHINE ArithmeticLaws
DEFINITIONS
 MAX_x == 50;
 MAX_y == 9;
 MAX_z == 4;
 MIN_x == -3;
 MIN_y == -3;
 MIN_z == -3
VARIABLES x,y,z
INVARIANT
 x:INTEGER & y:INTEGER & z:INTEGER &

 x*y = y*x &
 x*(y+z) = x*y + x*z &
 x+y = y+x &
 x*1 = x &
 1*x = x &
 x*0 = 0 &
 0*x = 0 &
 (x+y)+z = x + (y+z) &
 (x*y)*z = x*(y*z) &
 2*x = x+x &
 x**2 = x*x &
 (x>=0 => 1**x = 1) &
 (x>=0 => (((x / 2)*2 = x) <=> (x mod 2 = 0))) &
 (x>0 => 2**x = 2*(2**(x-1))) &
 (x>0 => 2**(10*x) = 2*(2**(10*x-1))) &
 (x>0 => 3**(10*x) = 3*(3**(10*x-1))) &

 (y /= 0 => /* from page 51, manrefb1.8.6 */
    ( -x/y = -(x/y) &
      x/-y = -(x/y) &
      (x>=0 & y>0 =>
          (x mod y = x - y * ( x / y )) &
          x/y = min({q|q:NATURAL & q:0..x & x<y*(q+1)}) /* page 164, B-Book; added q:0..x for efficiency reasons */
      )
    ) ) &

 (x>y or x<=y) &
 (x>y or x=y or x<y) &
 (x>=y or x<y) &
 (x>=y or x<=y) &
 not(x>y & x<=y) &
 not(x<y & y<x) &
 (x-x) = 0 &
 (x=y <=>  x-y = 0) &
 (x>y <=> x >= y+1) &
 (x<y <=> x <= y-1) &
 ((x<y or y<x) <=> x/=y) &
 ((x<y & y<=z) => x<z) &
 ((x<y & y<z) => x<z) &
 ((x<=y & y<z) => x<z) &
 ((x<=y & y<=z) => x<=z) &
 ((x<=y & y<=x) => x=y) &

 (x=y <=> y=x) &
 (x/=y <=> y/=x) &
 (x<y <=> y>x) &
 (x>y <=> y<x) &
 (x<=y <=> y>=x) &
 (x>=y <=> y<=x) &
 (not(x<y) <=> x>=y) &
 (not(x<=y) <=> x>y) &
 ((x=y or x=z) => (y=x or z=x)) &
 ((x=y or x=z) <=> (y=x or z=x)) &
 ((x=y <=> x=z) => (y=z or x/=y)) &


 (x-y-x+y = 0) &
  x*x >= 0 &
 (x*x = 0 <=> x=0) &
 (x*x = -x * -x) &
 (x<=y <=> min({x,y}) = x) &
 (x<=y <=> max({x,y}) = y) &
 (x<y <=> max({x,y}) /= x) &
 (x<y <=> min({x,y}) /= y) &
 (x>=0 & y>0 => ((x/y) * y = x - x mod y)) &
 (x/=y & x/=z & y/=z => SIGMA(zz).(zz:{x,y,z}|zz) = x+y+z) &
 (x/=y & x/=z & y/=z => PI(zz).(zz:{x,y,z}|zz) = x*y*z) &
 (SIGMA(zz).(zz:{x}|zz) = x) &
 (PI(zz).(zz:{x}|zz) = x)
 &
 (succ(x) = x+1)  &
 (pred(x) = x-1)  &
 (x < succ(x)) &
 (x > pred(x)) &
 (pred(succ(x)) = x) &
 (x+succ(y) = succ(x+y)) &
 (x*succ(y) = x+x*y) &
 (x>=0 => 1**x = 1) &
  x**1 = x &
  x**0 = 1 &
 (x>0 => 0**x = 0) &
 (z>=0 => (x*y)**z = x**z * y**z) &
 (y>=0 & z>=0 => (x**(y+z) = x**y * x**z)) &
 (y>=0 & z>=0 => (x**(y*z) = (x**y)**z)) &


  #x.(x:INTEGER & {x} \/ {1,2} = {1,2} ) &

  /* laws about min from page 156 of B-Book */
  min({x}) = x &
  (x <= y => min({x,y}) = x ) &
  (y <= x => min({x,y}) = y ) &
  min({x}\/{y,z}) = min({min({x}), min({y,z})}) &
  min({y,z} \/ {x}) = min({min({y,z}),x}) &

  /* laws about max from page 158 of B-Book */
  max({x}) = x &
  (y <= x => max({x,y}) = x ) &
  (x <= y => max({x,y}) = y ) &
  max({x}\/{y,z}) = max({max({x}), max({y,z})}) &
  max({y,z} \/ {x}) = max({max({y,z}),x}) &

  /* laws from page 164 of B-Book */
  (x:NATURAL & y:NATURAL1 => x/y = min({xx| xx:NATURAL & x<y*succ(xx) & xx:0..x})) &
  (x:NATURAL & y:NATURAL1 => x mod y = (x - y*(x/y)))

  /* & (x<y-1 => #v.(x<v & v<y))  has issues if MININT and MAXINT not large enough */

  /* reification laws */
  & x:y..z <=> (y<=x & x<=z)
  & x:y..z <=> (y<=x & x<=z & y<=z)

  /* priority laws */
  & not(2=3 & 1=1 <=>  4=5 & 2=2)
INITIALISATION x,y,z := MIN_x,MIN_y,MIN_z
OPERATIONS
  IncX = PRE x<MAX_x THEN x := x+1 END;
  IncY = PRE y<MAX_y THEN y := y+1 END;
  IncZ = PRE z<MAX_z THEN z := z+1 END /* ;
  AddToZ(a) = PRE a:NATURAL THEN z := z+a END */
END
