MACHINE RealExternalFunctions
DEFINITIONS
  "LibraryReals.def"
ASSERTIONS
  1.2 /= 1.0;
  RADD(1.0,2.0) = 3.0;
  RMUL(1.0,2.0) = 2.0;
  RSUB(2.0,1.0) = 1.0;
  RDIV(10.0,2.0) = 5.0;
  floor(1.2) = 1;
  ceiling(1.2) = 2;
  real(1) = 1.0;
  card({1.2, 1.0, 1.20}) = 2;
  2.0 - 1.0 = 1.0;
  10.0 * 1.0 = 10.0;
  !x.(x:-100..100 => floor(real(x)) = x);
  RSIN(0.0) = 0.0;
  RCOS(0.0) = 1.0;
  RLOGe(REXP(1.0)) = 1.0;
  RSQRT(4.0) = 2.0;
  RPOW(2.0,5.0) = 32.0;
  RLOG(2.0,32.0) = 5.0;
  %i.(i:1..2|RPOW(2.0,real(i))) = [2.0, 4.0];
  {x | x <= 1.0 & x: {0.0, 1.0, 1.001, -1.0}} = {-1.0,0.0,1.0};
  {x | x > 1.0 & x: {0.0, 1.0, 1.001, -1.0}} = {1.001};
  FLOAT <: REAL;
  REAL <: REAL;
  FLOAT <: FLOAT;
  REAL /<: FLOAT;
  FLOAT <<: REAL
END

