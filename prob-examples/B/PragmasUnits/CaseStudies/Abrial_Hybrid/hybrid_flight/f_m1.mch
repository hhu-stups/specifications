
MACHINE f_m1
CONCRETE_CONSTANTS
  p,
  pi,
  rhoi,
  sin_phi_d_2,
  sqrt3,
  v,
  cos,
  sqrt
ABSTRACT_VARIABLES
  now,
  rho_c,
  phase,
  r,
  rho
PROPERTIES
    p : INT
  & pi : INT
  & rhoi : INT
  & sin_phi_d_2 : INT
  & sqrt3 : INT
  & v : INT
  & /* @axm1 */ rhoi > 0
  & /* @axm7 */ p > 0
  & /* @axm6 */ sin_phi_d_2 > 0
  & /* @axm8 */ sqrt3 > 0
  & /* @axm10 */ pi > 0
  & /* @axm1 */ v > 0
  & /* @axm4 */ !(x).(x : INT => v * (x / v) = x)
  & /* @axm5 */ !(x).(x : INT & x > 0 => x / v > 0)
  & /* @axm7 */ !(x).(x : INT & x >= 0 => x / v >= 0)
  & /* @axm8 */ 3 * v > 0
  & /* @axm9 */ !(x).(x : INT & x >= 0 => x / (3 * v) >= 0)
  & /* @axm10 */ !(x).(x : INT & x > 0 => (v * ((pi * x) / (3 * v))) / x = pi / 3)
  & /* @axm1 */ sqrt : NAT --> NAT
  & /* @axm2 */ cos : INT --> -1 .. 1
  & /* @axm3 */ !(x,y,z).((y : INT & z : INT) & (x : NAT & (y > 0 & z > 0)) => ((x * y) / z) / y = x / z)
  & /* @axm4 */ cos(0) = 1
  & /* @axm5 */ sqrt(1) = 1
  & /* @axm7 */ sqrt3 = sqrt(3)
  & /* @axm8 */ !(a,b,c).(((a : INT & b : INT) & c : INT) & (c > 0 & b > 0) => (v * (((a * b) / c) / v)) / b = a / c)
INVARIANT
    phase : INT
  & r : INT
  & rho : INT
  & /* @inv1 */ now : NAT
  & /* @inv2 */ rho_c : NAT --> INT
  & /* @inv3 */ rho = rho_c(now)
  & (/* @inv4 */ phase : {0,1} => now = 0)
  & (/* @inv5 */ phase = 1 => r * sqrt3 <= rhoi)
  & (/* @inv6 */ phase = 0 => rho_c = %t.(t : INT & t >= 0|rhoi))
  & (/* @inv7 */ phase = 1 => rho_c = %t.(t : INT & t >= 0|rhoi))
  & (/* @inv8 */ phase = 3 => !(t).(t : INT & t >= now => rho_c(t) = r * sqrt(5 - 4 * cos(pi / 3 - (v * ((t - now) + (pi * r) / (3 * v))) / r))))
  & /* @inv1 */ rho > 0
  & /* @inv3 */ r > 0
  & /* @inv5 */ 2 * (rho * sin_phi_d_2) >= p
  & (/* @inv6 */ phase /= 0 => 2 * (r * sin_phi_d_2) >= p)
  & (/* @inv7 */ phase = 1 => rhoi - sqrt3 * r : NAT)
INITIALISATION
         phase := 0
      ||
         r := 1
      ||
         now := 0
      ||
         rho_c := %t.(t : INT & t >= 0|rhoi)
OPERATIONS
  agree(c) = 
    PRE 
        c : INT
    THEN
      ANY c
      WHERE 
          /* @grd1 */ phase = 0
        & /* @grd2 */ c > 0
        & /* @grd3 */ p <= 2 * (c * sin_phi_d_2)
        & /* @grd4 */ c * sqrt3 <= rhoi
      THEN 
           phase := 1
        ||
           r := c
      END
    END;
  
  start = 
    PRE 
        /* @grd1 */ phase = 1
    THEN 
         phase := 2
      ||
         rho_c := rho_c <+ %t.(t : INT & t >= now|rhoi - v * (t - now))
      ||
         now := now + (rhoi - sqrt3 * r) / v
    END;
  
  turning_1 = 
    PRE 
        /* @grd1 */ phase = 2
    THEN 
         phase := 3
      ||
         now := now + (pi * r) / (3 * v)
      ||
         rho_c := rho_c <+ %t.(t : INT & t >= now|r * sqrt(5 - 4 * cos(pi / 3 - (v * (t - now)) / r)))
    END;
  
  cycling = 
    PRE 
        /* @grd1 */ phase = 3
    THEN 
         phase := 4
      ||
         now := now + (2 * (pi * r)) / (3 * v)
      ||
         rho_c := rho_c <+ %t.(t : INT & t >= now|r)
    END;
  
  turning_2 = 
    PRE 
        /* @grd1 */ phase = 4
    THEN 
         phase := 5
      ||
         now := now + (pi * r) / (3 * v)
      ||
         rho_c := rho_c <+ %t.(t : INT & t >= now|r * sqrt(5 - 4 * cos((v * (t - now)) / r)))
    END
END
