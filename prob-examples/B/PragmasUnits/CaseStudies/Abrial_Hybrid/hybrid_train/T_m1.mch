
MACHINE T_m1
CONCRETE_CONSTANTS
  A,
  /*@ unit "m / s**2" */ b,
  /*@ unit "s" */ e,
  sl
ABSTRACT_VARIABLES
  a2,
  phase2,
  v2,
  z2,
  a,
  m,
  phase,
  v,
  z
PROPERTIES
    /* @axm1 */ e > 0
  & /* @axm2 */ A > 0
  & /* @axm3 */ b > 0
  & /* @axm6 */ b = 1
  & /* @axm7 */ A = 2
  & /* @axm9 */ e = 2
  & /* @axm10 */ sl > 0
INVARIANT
    /* @inv1 */ phase2 : {0,1,2}
  & /* @inv2 */ z2 : NATURAL
  & /* @inv3 */ a2 : {0,A,-b}
  & /* @inv4 */ v2 : NATURAL
  & /* @inv1 */ phase : {0,1,2}
  & /* @inv3 */ z : NATURAL
  & /* @inv4 */ a : {0,A,-b}
  & /* @inv5 */ v : NATURAL
  & /* @inv10 */ m : NATURAL
  & /* @inv7 */ 2 * m - 2 * z >= v * v
ASSERTIONS
  /* @axm5 */ !(x,y).((x : INTEGER & y : INTEGER) & not(y = 0) => y * (x / y) = x);
  /* @axm8 */ A * b = 2;
  /* @inv6 */ z - z2 >= 0;
  /* @inv6 */ m - z >= 0
INITIALISATION
  phase := 1 || z := 0 || v := 0 || a := 2 || m := 0 || phase2 := 1 || z2 := 0 || a2 := 0 || v2 := 0
OPERATIONS
  get_limit(x) =
    PRE
        x : 1 .. 300
      & v = 0
      & m - z < 12
      & m = 0
    THEN
         m := m + x
    END;

  decide_1 =
    PRE
        phase = 1
      & 2 * b * (m - z) < v * v + (A * e**2 + 2 * v * e) * (A + b)
      & A > 0
      & v > 0
    THEN
         a := -b
      ||
         phase := 2
    END;

  decide_2 =
    PRE
        phase = 1
      & 2 * b * (m - z) >= v * v + (A * e**2 + 2 * v * e) * (A + b)
      & v >= 0
      & e > 0
      & A > 0
      & v + e * A <= sl
    THEN
         a := 2
      ||
         phase := 2
    END;

  decide_3 =
    PRE
        phase = 1
      & 2 * b * (m - z) >= v * v + (A * e**2 + 2 * v * e) * (A + b)
      & v >= 0
      & e > 0
      & A > 0
      & v + e * A > sl
      & v > 0
    THEN
         a := 0
      ||
         phase := 2
    END;

  drive_1 =
    PRE
        phase = 2
      & v + e * a <= 0
      & a = -b
    THEN
         v := 0
      ||
         z := z + (v * v) / (2 * b)
      ||
         phase := 1
    END;

  drive_2 =
    PRE
        phase = 2
      & v + e * a > 0
      & v >= 0
    THEN
         v := v + e * a
      ||
         z := z + e * v + a * e**2 / 2
      ||
         phase := 1
    END;

  decide_1_2 =
    PRE
        phase2 = 1
      & 2 * b * (z - z2) < v2 * v2 + (A * e**2 + 2 * v2 * e) * (A + b)
      & v2 > 0
    THEN
         a2 := -b
      ||
         phase2 := 2
    END;

  decide_2_2 =
    PRE
        phase2 = 1
      & 2 * b * (z - z2) >= v2 * v2 + (A * e**2 + 2 * v2 * e) * (A + b)
      & v2 + e * A <= sl
    THEN
         phase2 := 2
      ||
         a2 := 2
    END;

  decide_3_2 =
    PRE
        phase2 = 1
      & 2 * b * (z - z2) >= v2 * v2 + (A * e**2 + 2 * v2 * e) * (A + b)
      & v2 + e * A > sl
      & v2 > 0
    THEN
         a2 := 0
      ||
         phase2 := 2
    END;

  drive_1_2 =
    PRE
        phase2 = 2
      & v2 + e * a2 <= 0
    THEN
         v2 := 0
      ||
         z2 := z2 + (v2 * v2) / (2 * b)
      ||
         phase2 := 1
    END;

  drive_2_2 =
    PRE
        phase2 = 2
      & v2 + 2 * a2 > 0
    THEN
         v2 := v2 + e * a2
      ||
         z2 := z2 + e * v2 + a2 * e**2 / 2
      ||
         phase2 := 1
    END
END
