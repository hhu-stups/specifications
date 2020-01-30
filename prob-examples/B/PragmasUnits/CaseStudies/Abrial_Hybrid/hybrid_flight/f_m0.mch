
MACHINE f_m0
CONCRETE_CONSTANTS
  p,
  pi,
  rhoi,
  sin_phi_d_2,
  sqrt3
ABSTRACT_VARIABLES
  phase,
  r,
  rho
PROPERTIES
    p : INT
  & pi : INT
  & rhoi : INT
  & sin_phi_d_2 : INT
  & sqrt3 : INT
  & /* @axm1 */ rhoi > 0
  & /* @axm7 */ p > 0
  & /* @axm6 */ sin_phi_d_2 > 0
  & /* @axm8 */ sqrt3 > 0
  & /* @axm10 */ pi > 0
INVARIANT
    phase : INT
  & r : INT
  & rho : INT
  & /* @inv1 */ rho > 0
  & /* @inv3 */ r > 0
  & /* @inv5 */ 2 * (rho * sin_phi_d_2) >= p
  & (/* @inv6 */ phase /= 0 => 2 * (r * sin_phi_d_2) >= p)
  & (/* @inv7 */ phase = 1 => rhoi - sqrt3 * r : NAT)
INITIALISATION
         rho := rhoi
      ||
         phase := 0
      ||
         r := 1
OPERATIONS
  agree(c) = 
    PRE 
        c : INT
    THEN
      ANY c
      WHERE 
          phase = 0
        & c > 0
        & p <= 2 * (c * sin_phi_d_2)
        & c * sqrt3 <= rhoi
      THEN 
           phase := 1
        ||
           r := c
      END
    END;
  
  start = 
    PRE 
        phase = 1
    THEN 
         phase := 2
      ||
         rho := sqrt3 * r
    END;
  
  turning_1 = 
    PRE 
        phase = 2
    THEN 
         phase := 3
      ||
         rho := r
    END;
  
  cycling = 
    PRE 
        phase = 3
    THEN 
         phase := 4
    END;
  
  turning_2 = 
    PRE 
        phase = 4
    THEN 
         phase := 5
      ||
         rho := r * sqrt3
    END
END
