MACHINE LawsArithmeticCsts
/* Check that neither Kodkod nor ProB constraint solver finds solution
   (which would be a counter-example to a mathematical law) */
DEFINITIONS
  mx == 10
CONSTANTS x,y,z
PROPERTIES
  x: (0-mx)..mx & y:(0-1)..mx & z:(0-1)..mx &
  not (
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
  /* x**2 = x*x &
 (x>=0 => (((x / 2)*2 = x) <=> (x mod 2 = 0))) & 
 (x>0 => 2**x = 2*(2**(x-1))) &
 (x>0 => 2**(10*x) = 2*(2**(10*x-1))) &
 (x>0 => 3**(10*x) = 3*(3**(10*x-1))) & */
 
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
 
  2+2=4
  )
END

