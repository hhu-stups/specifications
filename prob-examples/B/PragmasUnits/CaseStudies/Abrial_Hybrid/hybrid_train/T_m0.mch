
MACHINE T_m0
CONSTANTS
  A,
  b,
  e,
  sl
VARIABLES
  /*@ unit "mps" */ a,
  m,
  phase,
  /*@ unit "mps" */ v,
  /*@ unit "m" */ z
PROPERTIES
    /* @axm1 */ e > 0
  & /* @axm2 */ A > 0
  & /* @axm3 */ b > 0
  & /* @axm6 */ b = 1
  & /* @axm7 */ A = 2
  & /* @axm9 */ e = 2
  & /* @axm10 */ sl > 0
  & /* @axm11 */ !(x).(x : NATURAL => 2 * ((x * x) / 2) : NATURAL)
INVARIANT
    /* @inv1 */ phase : {0,1,2}
  & /* @inv3 */ z : NATURAL
  & /* @inv4 */ a : {0,A,-b}
  & /* @inv5 */ v : NATURAL
  & /* @inv10 */ m : NATURAL
  & /* @inv7 */ 2 * m - 2 * z >= v * v
  & (/* @inv8 */ phase = 2 & v + 2 * a <= 0 => a = -b)
  & (/* @inv9 */ phase = 2 & a = A => 2 * m - 2 * z >= v * v + (24 + 12 * v))
  & (/* @inv11 */ phase = 2 & a = 0 => 2 * m - 2 * z >= v * v + (24 + 12 * v))
ASSERTIONS
  /* @axm5 */ !(x,y).((x : INTEGER & y : INTEGER) & not(y = 0) => y * (x / y) = x);
  /* @axm8 */ A * b = 2;
  /* @inv6 */ m - z >= 0
INITIALISATION
  phase,z,v,a,m := 1,0,0,2,0
OPERATIONS
  get_limit(x) =
    PRE
        /* @grd1 */ x : 1 .. 300
      & /* @grd3 */ v = 0
      & /* @grd4 */ m - z < 12
    THEN
         m := m + x
    END;

  decide_1 =
    PRE
        /* @grd1 */ phase = 1
      & /* @grd2 */ 2 * m - 2 * z < v * v + (24 + 12 * v)
      & /* @grd3 */ A > 0
      & /* @grd4 */ v > 0
    THEN
         a := -b
      ||
         phase := 2
    END;

  decide_2 =
    PRE
        /* @grd1 */ phase = 1
      & /* @grd2 */ 2 * m - 2 * z >= v * v + (24 + 12 * v)
      & /* @grd3 */ v >= 0
      & /* @grd4 */ e > 0
      & /* @grd5 */ A > 0
      & /* @grd6 */ v + 4 <= sl
    THEN
         a := 2
      ||
         phase := 2
    END;

  decide_3 =
    PRE
        /* @grd1 */ phase = 1
      & /* @grd2 */ 2 * m - 2 * z >= v * v + (24 + 12 * v)
      & /* @grd3 */ v >= 0
      & /* @grd4 */ e > 0
      & /* @grd5 */ A > 0
      & /* @grd6 */ v + 4 > sl
      & /* @grd7 */ v > 0
    THEN
         a := 0
      ||
         phase := 2
    END;

  drive_1 =
    PRE
        /* @grd1 */ phase = 2
      & /* @grd2 */ v + 2 * a <= 0
      & /* @grd3 */ a = -b
    THEN
         v := 0
      ||
         z := z + (v * v) / 2
      ||
         phase := 1
    END;

  drive_2 =
    PRE
        /* @grd2 */ phase = 2
      & /* @grd3 */ v + 2 * a > 0
      & /* @grd4 */ v >= 0
    THEN
         v := v + 2 * a
      ||
         z := z + (2 * v + 2 * a)
      ||
         phase := 1
    END
END
