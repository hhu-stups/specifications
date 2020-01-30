
MACHINE C_m1_internal
CONCRETE_CONSTANTS
  /*@ unit "mins" */ T,
  /*@ inferred_unit "mins" */ a,
  /*@ inferred_unit "mins" */ b1,
  /*@ inferred_unit "mins" */ b2,
  /*@ unit "degC" */ tM,
  /*@ inferred_unit "degC" */ tm,
  /*@ inferred_unit "degC * mins**-1" */ v1,
  /*@ inferred_unit "degC * mins**-1" */ v2,
  /*@ inferred_unit "degC * mins**-1" */ vr,
  /*@ inferred_unit "unknown" */ p,
  /*@ inferred_unit "unknown" */ q,
  /*@ inferred_unit "unknown" */ r
ABSTRACT_VARIABLES
  /*@ inferred_unit "mins" */ now,
  /*@ inferred_unit "mins -> mins" */ t1_c,
  /*@ inferred_unit "mins -> mins" */ t2_c,
  /*@ inferred_unit "unknown" */ state,
  /*@ inferred_unit "mins" */ t1,
  /*@ inferred_unit "mins" */ t2,
  /*@ inferred_unit "degC" */ tp
PROPERTIES
    p : INT
  & q : INT
  & r : INT
  & a : NAT
  & b1 : NAT
  & b2 : NAT
  & T : NAT
  & 2 * a + b1 >= T
  & 2 * a + b2 >= T
  & a < T
  & tm : NAT
  & tM : NAT
  & tM > tm
  & v1 : NAT
  & v2 : NAT
  & vr : NAT
  & v1 * b1 = tM - tm
  & v2 * b2 = tM - tm
  & vr * a = tM - tm
  & p > 0
  & q > 0
  & r > 0
INVARIANT
    now : NAT
  & t1_c : NAT --> INT
  & t2_c : NAT --> INT
  & t1 = t1_c(now)
  & t2 = t2_c(now)
  & t1 : NAT
  & t2 : NAT
  & state : {0,1,2}
  & (state = 0 & t1 >= T => t2 >= a)
  & (state = 0 & t2 >= T => t1 >= a)
  & (state = 1 => t2 >= a + b1)
  & (state = 2 => t1 >= a + b2)
  & (state = 0 & t1 >= T => t1 >= 2 * a + b2 & t2 = a)
  & (state = 0 & t2 >= T => t2 >= 2 * a + b1 & t1 = a)
  & (state = 0 => t1 >= T or t2 >= T)
  & tp : NAT
  & (state = 1 => tp = tm)
  & (state = 2 => tp = tm)
  & (state = 0 => tp = tM)
ASSERTIONS
  state = 0 => t1_c(now) >= T or t2_c(now) >= T
INITIALISATION
    BEGIN
         t1_c := %t.(t : NAT|2 * a + b2)
      ||
         t2_c := %t.(t : NAT|a)
      ||
         state := 0
      ||
         now := 0
      ||
         tp := tM
    END
OPERATIONS
  cool_rod1 =
    PRE
        state = 0
      & t1_c(now) >= T
    THEN
      state,t2_c,now,t1_c,tp := 1,t2_c <+ %t.(t : INT & t >= now|t2_c(now) + (t - now)),now + b1,t1_c <+ %t.(t : INT & t >= now|t1_c(now)),tm
    END;

  cool_rod2 =
    PRE
        state = 0
      & t2_c(now) >= T
    THEN
      state,t1_c,now,t2_c,tp := 2,t1_c <+ %t.(t : INT & t >= now|t1_c(now) + (t - now)),now + b2,t2_c <+ %t.(t : INT & t >= now|t2_c(now)),tm
    END;

  release_rod1 =
    PRE
        state = 1
    THEN
      state,t1_c,t2_c,now,tp := 0,t1_c <+ %t.(t : INT & t >= now|t - now),t2_c <+ %t.(t : INT & t >= now|t2_c(now) + (t - now)),now + a,tM
    END;

  release_rod2 =
    PRE
        state = 2
    THEN
      state,t1_c,t2_c,now,tp := 0,t1_c <+ %t.(t : INT & t >= now|t1_c(now) + (t - now)),t2_c <+ %t.(t : INT & t >= now|t - now),now + a,tM
    END
END
