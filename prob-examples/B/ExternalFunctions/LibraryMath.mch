MACHINE LibraryMath
/* This Library Machine provides a convenient access to the ProB
   external mathematical functions */
ABSTRACT_CONSTANTS
 sin, cos, tan,  /* trigonometric functions with standard precision multiplier of 100 */
 sinx, cosx, tanx, /* more flexible version; user can specify precision multiplier */
 /* SINx(Multiplier,x) = round(Multiplier*sin(x/Multiplier)) */
 logx,
 /* LOGx(Multiplier,base,x) = round(Multiplier*log(base/Multiplier,x/Multiplier)) */
 gcd, /* greatest common divisor */
 msb, /* most significant bit */
 abs, /* absolute value */
 random /* generate a random number in a range */
DEFINITIONS
 EXTERNAL_FUNCTION_COS == INTEGER --> INTEGER;
 EXTERNAL_FUNCTION_SIN == INTEGER --> INTEGER;
 EXTERNAL_FUNCTION_TAN == INTEGER --> INTEGER;
 EXTERNAL_FUNCTION_SINx == INTEGER*INTEGER --> INTEGER;
 EXTERNAL_FUNCTION_COSx == INTEGER*INTEGER --> INTEGER;
 EXTERNAL_FUNCTION_TANx == INTEGER*INTEGER --> INTEGER;
 EXTERNAL_FUNCTION_LOGx == INTEGER*INTEGER*INTEGER --> INTEGER;

 EXTERNAL_FUNCTION_GCD == INTEGER*INTEGER --> INTEGER;
 EXTERNAL_FUNCTION_MSB == INTEGER --> INTEGER;
 EXTERNAL_FUNCTION_ABS == INTEGER --> INTEGER;
 COS(x) == cos(x); /* These macro get overriden by EXTERNAL_FUNCTION_ declarations */
 SIN(x) == sin(x);
 TAN(x) == tan(x);
 SINx(m,x) == sinx(m,x);
 COSx(m,x) == cosx(m,x);
 TANx(m,x) == tanx(m,x);
 LOGx(m,b,x) == logx(m,b,x);
 GCD(m,x) == gcd(m,x);
 MSB(x) == msb(x);
 ABS(x) == abs(x);

 EXTERNAL_FUNCTION_RANDOM == INTEGER*INTEGER --> INTEGER;
 RANDOM(x,y) == x;
 random_element(x) == max(x);
 EXTERNAL_FUNCTION_random_element(T) == POW(T) --> T;
 random_subset(x) == x;
 EXTERNAL_FUNCTION_random_subset(RANDOM_TYPE) == POW(RANDOM_TYPE) --> POW(RANDOM_TYPE)
PROPERTIES
  cos: NATURAL --> INTEGER &
  cos = %x.(x:NATURAL|COS(x)) /* This generates a "real" B function, where we can compute domain, compute image, ... */ &
  sin: INTEGER --> INTEGER &
  sin = %x.(x:INTEGER|SIN(x)) /* EXTERNAL */ &
  tan: INTEGER --> INTEGER &
  tan = %x.(x:INTEGER|TAN(x)) /* EXTERNAL */ &
  sinx: NATURAL1*INTEGER --> INTEGER &
  sinx = %(m,x).(x:INTEGER & m:NATURAL1|SINx(m,x)) /* EXTERNAL */  &
  cosx: NATURAL1*INTEGER --> INTEGER &
  cosx = %(m,x).(x:INTEGER & m:NATURAL1|COSx(m,x)) /* EXTERNAL */  &
  tanx: NATURAL1*INTEGER --> INTEGER &
  tanx = %(m,x).(x:INTEGER & m:NATURAL1|TANx(m,x)) /* EXTERNAL */  &
  logx: NATURAL1*NATURAL1*NATURAL1 --> INTEGER &
  logx = %(m,b,x).(x:NATURAL1 & b:NATURAL1 & m:NATURAL1|LOGx(m,b,x)) /* EXTERNAL */ &
  gcd: INTEGER*INTEGER --> INTEGER &
  gcd = %(x,y).(x:INTEGER & y:INTEGER|GCD(x,y)) /* EXTERNAL */  &
  msb: NATURAL1 --> INTEGER &
  msb = %x.(x:NATURAL1|MSB(x)) /* EXTERNAL */  &
  abs: INTEGER --> INTEGER &
  abs = %x.(x:INTEGER|ABS(x)) /* EXTERNAL */  &

  /* warning: this is *not* a mathematical function */
  /* it may not work as expected; e.g.,  {x,y|x:1..20 & y=random(1,100)} will generate
     the same number over and over; you have to use this: {x,y|x:1..20 & y=random(1,100+x-x)} */
  random: INTEGER*INTEGER --> INTEGER &
  random = %(x,y).(x:INTEGER & y:INTEGER|RANDOM(x,y)) /* EXTERNAL */

ASSERTIONS
  cos(314) = -100;
  sin(314) = 0;
  cos(628) = 100;
  sin(628) = 0;
  !i.(i:0..630 => (sin(i)*sin(i)+cos(i)*cos(i) : (99*99)..(101*101)));
  cos[0..628] = -100..100;
  sin[0..628] = -100..100;
  ([0,157,314];cos) = [100,0,-100];
  !i.(i:0..10000 => sin(i)<=100);
  !i.(i:0..628 => sin(i)=sinx(100,i));
  !i.(i:0..628 => cos(i)=cosx(100,i));
  !i.(i:0..628 => tan(i)=tanx(100,i));
  tan(0) = 0;
  tan(200) = -219; /* tan(2) = -2.185 */
  tanx(1000,2000) = -2185;
  tan(614) = -14; /* tan(6.14) = -0.1441719... */
  tanx(10000,61400) = -1442;
  logx(1,2,1024) = 10;
  logx(100,200,900) = 317; /* log2(9) = 3.16992500144231 */
  logx(10000,20000,90000) = 31699;
  gcd(10,22) = 2;
  gcd(500,30) = 10;
  gcd(-10,-15) = 5;
  msb(1024) = 10;
  msb(1025) = 10;
  abs(10) = 10;
  abs(-10) = 10;
  abs(0) = 0;
  /* this works in CLPFD mode: {x|abs(x) = 20000303} = {-20000303, 20000303}; */
  random(1,3) : 1..2;
  random_element(1..2) : 1..2;
  !x.(x:{ {1,2,3}, {4,5,8}, 1..100 } =>  random_element(x) : x);
  random_element({TRUE,FALSE}) : BOOL;
  random_subset(1..2) <: 1..2
/* these cause errors: (and should)
 ; logx(1,-2,-2) = 1
 ; logx(1,2,0) /= 1
 ; logx(0,2,2) /= 1
OPERATIONS
  r <-- err1 = BEGIN r:= LOGx(0,2,2) END;
  r <-- err2 = BEGIN r:= SINx(0,2) END
*/
END
