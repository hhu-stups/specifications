
MACHINE C_m0
CONCRETE_CONSTANTS
  /*@ unit "mins" */ T,
  a,
  b1,
  b2,
  /*@ unit "degC" */ tM,
  tm,
  v1,
  v2,
  vr
ABSTRACT_VARIABLES
  state,
  t1,
  t2,
  tp
PROPERTIES
    /* @axm1 */ a : NAT
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
INVARIANT
    /* @inv1 */ t1 : NAT
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
INITIALISATION
         t1 := 2 * a + b2
      ||
         t2 := a
      ||
         state := 0
      ||
         tp := tM
OPERATIONS
  cool_rod1 =
    PRE
        /* @grd1 */ state = 0
      & /* @grd2 */ t1 >= T
    THEN
         state := 1
      ||
         t2 := t2 + b1
      ||
         tp := tm
    END;

  cool_rod2 =
    PRE
        /* @grd1 */ state = 0
      & /* @grd2 */ t2 >= T
    THEN
         state := 2
      ||
         t1 := t1 + b2
      ||
         tp := tm
    END;

  release_rod1 =
    PRE
        /* @grd1 */ state = 1
    THEN
         state := 0
      ||
         t1 := a
      ||
         t2 := t2 + a
      ||
         tp := tM
    END;

  release_rod2 =
    PRE
        /* @grd1 */ state = 2
    THEN
         state := 0
      ||
         t1 := t1 + a
      ||
         t2 := a
      ||
         tp := tM
    END
END
