
MACHINE C_m3
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
  TT,
  new_now,
  temp,
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
    TT : BOOL
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
  & /* @inv1 */ now : NAT
  & /* @inv3 */ t1_c : NAT --> INT
  & /* @inv7 */ t2_c : NAT --> INT
  & /* @inv5 */ t1 = t1_c(now)
  & /* @inv8 */ t2 = t2_c(now)
  & /* @inv2 */ new_now : NAT
  & (/* @inv3 */ TT = FALSE => new_now = now)
  & (/* @inv4 */ state = 1 & TT = TRUE => new_now + b1 = now)
  & (/* @inv5 */ state = 2 & TT = TRUE => new_now + b2 = now)
  & (/* @inv6 */ state = 0 & TT = TRUE => new_now + a = now)
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
  & /* @inv1 */ temp : NAT --> INT
  & /* @inv2 */ tp = temp(now)
  & (/* @inv3 */ now >= a & state = 0 => min({t|t : INT & (t >= now - a & temp(t) = tM)}) = now)
  & (/* @inv4 */ now >= b1 & state = 1 => min({t|t : INT & (t >= now - b1 & temp(t) = tm)}) = now)
  & (/* @inv5 */ now >= b2 & state = 2 => min({t|t : INT & (t >= now - b2 & temp(t) = tm)}) = now)
  & /* @inv1 */ now : NAT
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
  /* @thm */ state = 0 => t1_c(now) >= T or t2_c(now) >= T;
  /* @inv7 */ state = 0 & TT = TRUE => min({t|t : INT & (t >= new_now & temp(t) = tM)}) = new_now + a;
  /* @inv8 */ state = 1 & TT = TRUE => min({t|t : INT & (t >= new_now & temp(t) = tm)}) = new_now + b1;
  /* @inv9 */ state = 2 & TT = TRUE => min({t|t : INT & (t >= new_now & temp(t) = tm)}) = new_now + b2;
  /* @thm */ state = 0 => t1_c(now) >= T or t2_c(now) >= T
INITIALISATION
         t1_c := %t.(t : NAT|2 * a + b2)
      ||
         t2_c := %t.(t : NAT|a)
      ||
         state := 0
      ||
         temp := %t.(t : NAT|tM)
      ||
         TT := FALSE
      ||
         new_now := 0
OPERATIONS
  cool_rod1 =
    PRE
        /* @grd1 */ state = 0
      & /* @grd2 */ t1_c(new_now) >= T
      & /* @grd5 */ TT = FALSE
    THEN
         state := 1
      ||
         t2_c := t2_c <+ %t.(t : INT & t >= new_now|t2_c(new_now) + (t - new_now))
      ||
         TT := TRUE
      ||
         t1_c := t1_c <+ %t.(t : INT & t >= new_now|t1_c(new_now))
      ||
         temp := temp <+ %t.(t : INT & t >= new_now|tM - v1 * (t - new_now))
    END;

  cool_rod2 =
    PRE
        /* @grd1 */ state = 0
      & /* @grd2 */ t2_c(new_now) >= T
      & /* @grd5 */ TT = FALSE
    THEN
         state := 2
      ||
         t1_c := t1_c <+ %t.(t : INT & t >= new_now|t1_c(new_now) + (t - new_now))
      ||
         TT := TRUE
      ||
         t2_c := t2_c <+ %t.(t : INT & t >= new_now|t2_c(new_now))
      ||
         temp := temp <+ %t.(t : INT & t >= new_now|tM - v2 * (t - new_now))
    END;

  release_rod1 =
    PRE
        /* @grd1 */ state = 1
      & /* @grd4 */ TT = FALSE
    THEN
         state := 0
      ||
         t1_c := t1_c <+ %t.(t : INT & t >= new_now|t - new_now)
      ||
         t2_c := t2_c <+ %t.(t : INT & t >= new_now|t2_c(new_now) + (t - new_now))
      ||
         TT := TRUE
      ||
         temp := temp <+ %t.(t : INT & t >= new_now|tm + vr * (t - new_now))
    END;

  release_rod2 =
    PRE
        /* @grd1 */ state = 2
      & /* @grd4 */ TT = FALSE
    THEN
         state := 0
      ||
         t1_c := t1_c <+ %t.(t : INT & t >= new_now|t1_c(new_now) + (t - new_now))
      ||
         t2_c := t2_c <+ %t.(t : INT & t >= new_now|t - new_now)
      ||
         TT := TRUE
      ||
         temp := temp <+ %t.(t : INT & t >= new_now|tm + vr * (t - new_now))
    END;

  TIME_1 =
    PRE
        /* @grd1 */ state = 1
      & /* @grd2 */ TT = TRUE
    THEN
         new_now := new_now + b1
      ||
         TT := FALSE
    END;

  TIME_2 =
    PRE
        /* @grd1 */ state = 2
      & /* @grd2 */ TT = TRUE
    THEN
         new_now := new_now + b2
      ||
         TT := FALSE
    END;

  TIME_3 =
    PRE
        /* @grd1 */ state = 0
      & /* @grd2 */ TT = TRUE
    THEN
         new_now := new_now + a
      ||
         TT := FALSE
    END
END
