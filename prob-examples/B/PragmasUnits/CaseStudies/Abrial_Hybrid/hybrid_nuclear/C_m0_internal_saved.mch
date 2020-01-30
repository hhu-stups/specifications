
MACHINE C_m0_internal
CONCRETE_CONSTANTS
  /*@ unit "mins" */ T,
  /*@ inferred_unit "mins" */ a,
  /*@ inferred_unit "mins" */ b1,
  /*@ inferred_unit "mins" */ b2,
  /*@ unit "degC" */ tM,
  /*@ inferred_unit "degC" */ tm,
  /*@ inferred_unit "degC * mins**-1" */ v1,
  /*@ inferred_unit "degC * mins**-1" */ v2,
  /*@ inferred_unit "degC * mins**-1" */ vr
ABSTRACT_VARIABLES
  /*@ inferred_unit "unknown" */ state,
  /*@ inferred_unit "mins" */ t1,
  /*@ inferred_unit "mins" */ t2,
  /*@ inferred_unit "degC" */ tp
PROPERTIES
    a : NAT
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
INVARIANT
    t1 : NAT
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
INITIALISATION
    BEGIN
         t1 := 2 * a + b2
      ||
         t2 := a
      ||
         state := 0
      ||
         tp := tM
    END
OPERATIONS
  cool_rod1 =
    PRE
        state = 0
      & t1 >= T
    THEN
         state := 1
      ||
         t2 := t2 + b1
      ||
         tp := tm
    END;

  cool_rod2 =
    PRE
        state = 0
      & t2 >= T
    THEN
         state := 2
      ||
         t1 := t1 + b2
      ||
         tp := tm
    END;

  release_rod1 =
    PRE
        state = 1
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
        state = 2
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
