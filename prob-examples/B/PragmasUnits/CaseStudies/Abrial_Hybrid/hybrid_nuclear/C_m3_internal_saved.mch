
MACHINE C_m3_internal
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
  /*@ inferred_unit "unknown" */ TT,
  /*@ inferred_unit "mins" */ new_now,
  /*@ inferred_unit "mins -> degC" */ temp,
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
    TT : BOOL
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
  & now : NAT
  & t1_c : NAT --> INT
  & t2_c : NAT --> INT
  & t1 = t1_c(now)
  & t2 = t2_c(now)
  & new_now : NAT
  & (TT = FALSE => new_now = now)
  & (state = 1 & TT = TRUE => new_now + b1 = now)
  & (state = 2 & TT = TRUE => new_now + b2 = now)
  & (state = 0 & TT = TRUE => new_now + a = now)
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
  & temp : NAT --> INT
  & tp = temp(now)
  & (now >= a & state = 0 => min({t|t : INT & (t >= now - a & temp(t) = tM)}) = now)
  & (now >= b1 & state = 1 => min({t|t : INT & (t >= now - b1 & temp(t) = tm)}) = now)
  & (now >= b2 & state = 2 => min({t|t : INT & (t >= now - b2 & temp(t) = tm)}) = now)
  & now : NAT
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
  state = 0 => t1_c(now) >= T or t2_c(now) >= T;
  state = 0 & TT = TRUE => min({t|t : INT & (t >= new_now & temp(t) = tM)}) = new_now + a;
  state = 1 & TT = TRUE => min({t|t : INT & (t >= new_now & temp(t) = tm)}) = new_now + b1;
  state = 2 & TT = TRUE => min({t|t : INT & (t >= new_now & temp(t) = tm)}) = new_now + b2;
  state = 0 => t1_c(now) >= T or t2_c(now) >= T
INITIALISATION
    BEGIN
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
    END
OPERATIONS
  cool_rod1 =
    PRE
        state = 0
      & t1_c(new_now) >= T
      & TT = FALSE
    THEN
      state,t2_c,TT,t1_c,temp := 1,t2_c <+ %t.(t : INT & t >= new_now|t2_c(new_now) + (t - new_now)),TRUE,t1_c <+ %t.(t : INT & t >= new_now|t1_c(new_now)),temp <+ %t.(t : INT & t >= new_now|tM - v1 * (t - new_now))
    END;

  cool_rod2 =
    PRE
        state = 0
      & t2_c(new_now) >= T
      & TT = FALSE
    THEN
      state,t1_c,TT,t2_c,temp := 2,t1_c <+ %t.(t : INT & t >= new_now|t1_c(new_now) + (t - new_now)),TRUE,t2_c <+ %t.(t : INT & t >= new_now|t2_c(new_now)),temp <+ %t.(t : INT & t >= new_now|tM - v2 * (t - new_now))
    END;

  release_rod1 =
    PRE
        state = 1
      & TT = FALSE
    THEN
      state,t1_c,t2_c,TT,temp := 0,t1_c <+ %t.(t : INT & t >= new_now|t - new_now),t2_c <+ %t.(t : INT & t >= new_now|t2_c(new_now) + (t - new_now)),TRUE,temp <+ %t.(t : INT & t >= new_now|tm + vr * (t - new_now))
    END;

  release_rod2 =
    PRE
        state = 2
      & TT = FALSE
    THEN
      state,t1_c,t2_c,TT,temp := 0,t1_c <+ %t.(t : INT & t >= new_now|t1_c(new_now) + (t - new_now)),t2_c <+ %t.(t : INT & t >= new_now|t - new_now),TRUE,temp <+ %t.(t : INT & t >= new_now|tm + vr * (t - new_now))
    END;

  TIME_1 =
    PRE
        state = 1
      & TT = TRUE
    THEN
         new_now := new_now + b1
      ||
         TT := FALSE
    END;

  TIME_2 =
    PRE
        state = 2
      & TT = TRUE
    THEN
         new_now := new_now + b2
      ||
         TT := FALSE
    END;

  TIME_3 =
    PRE
        state = 0
      & TT = TRUE
    THEN
         new_now := new_now + a
      ||
         TT := FALSE
    END
END
