
MACHINE C_m1
CONCRETE_CONSTANTS
  /*@ unit "mins" */ T,
  a,
  b1,
  b2,
  /*@ unit "degC" */ tM,
  tm,
  v1,
  v2,
  vr,
  p,
  q,
  r
ABSTRACT_VARIABLES
  now,
  t1_c,
  t2_c,
  state,
  t1,
  t2,
  tp
PROPERTIES
    p : INT
  & q : INT
  & r : INT
  & /* @axm1 */ a : NAT
  & /* @axm2 */ b1 : NAT
  & /* @axm3 */ b2 : NAT
  & /* @axm4 */ T : NAT
  & /* @axm5 */ 2 * a + b1 >= T
  & /* @axm6 */ 2 * a + b2 >= T
  & /* @axm7 */ a < T
  & /* @axm8 */ tm : NAT
  & /* @axm9 */ tM : NAT
  & /* @axm10 */ tM > tm
  & /* @axm11 */ v1 : NAT
  & /* @axm12 */ v2 : NAT
  & /* @axm13 */ vr : NAT
  & /* @axm14 */ v1 * b1 = tM - tm
  & /* @axm15 */ v2 * b2 = tM - tm
  & /* @axm16 */ vr * a = tM - tm
  & /* @axm1 */ p > 0
  & /* @axm2 */ q > 0
  & /* @axm3 */ r > 0
INVARIANT
    /* @inv1 */ now : NAT
  & /* @inv3 */ t1_c : NAT --> INT
  & /* @inv7 */ t2_c : NAT --> INT
  & /* @inv5 */ t1 = t1_c(now)
  & /* @inv8 */ t2 = t2_c(now)
  & /* @inv1 */ t1 : NAT
  & /* @inv2 */ t2 : NAT
  & /* @inv3 */ state : {0,1,2}
  & (/* @inv4 */ state = 0 & t1 >= T => t2 >= a)
  & (/* @inv5 */ state = 0 & t2 >= T => t1 >= a)
  & (/* @inv6 */ state = 1 => t2 >= a + b1)
  & (/* @inv7 */ state = 2 => t1 >= a + b2)
  & (/* @inv8 */ state = 0 & t1 >= T => t1 >= 2 * a + b2 & t2 = a)
  & (/* @inv9 */ state = 0 & t2 >= T => t2 >= 2 * a + b1 & t1 = a)
  & (/* @inv10 */ state = 0 => t1 >= T or t2 >= T)
  & /* @inv11 */ tp : NAT
  & (/* @inv12 */ state = 1 => tp = tm)
  & (/* @inv13 */ state = 2 => tp = tm)
  & (/* @inv14 */ state = 0 => tp = tM)
ASSERTIONS
  /* @thm */ state = 0 => t1_c(now) >= T or t2_c(now) >= T
INITIALISATION
         t1_c := %t.(t : NAT|2 * a + b2)
      ||
         t2_c := %t.(t : NAT|a)
      ||
         state := 0
      ||
         now := 0
      ||
         tp := tM
OPERATIONS
  cool_rod1 =
    PRE
        /* @grd1 */ state = 0
      & /* @grd2 */ t1_c(now) >= T
    THEN
         state := 1
      ||
         t2_c := t2_c <+ %t.(t : INT & t >= now|t2_c(now) + (t - now))
      ||
         now := now + b1
      ||
         t1_c := t1_c <+ %t.(t : INT & t >= now|t1_c(now))
      ||
         tp := tm
    END;

  cool_rod2 =
    PRE
        /* @grd1 */ state = 0
      & /* @grd2 */ t2_c(now) >= T
    THEN
         state := 2
      ||
         t1_c := t1_c <+ %t.(t : INT & t >= now|t1_c(now) + (t - now))
      ||
         now := now + b2
      ||
         t2_c := t2_c <+ %t.(t : INT & t >= now|t2_c(now))
      ||
         tp := tm
    END;

  release_rod1 =
    PRE
        /* @grd1 */ state = 1
    THEN
         state := 0
      ||
         t1_c := t1_c <+ %t.(t : INT & t >= now|t - now)
      ||
         t2_c := t2_c <+ %t.(t : INT & t >= now|t2_c(now) + (t - now))
      ||
         now := now + a
      ||
         tp := tM
    END;

  release_rod2 =
    PRE
        /* @grd1 */ state = 2
    THEN
         state := 0
      ||
         t1_c := t1_c <+ %t.(t : INT & t >= now|t1_c(now) + (t - now))
      ||
         t2_c := t2_c <+ %t.(t : INT & t >= now|t - now)
      ||
         now := now + a
      ||
         tp := tM
    END
END
