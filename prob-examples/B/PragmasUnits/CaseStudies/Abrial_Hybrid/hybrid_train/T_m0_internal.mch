
MACHINE T_m0_internal
CONCRETE_CONSTANTS
  /*@ inferred_unit "mps" */ A,
  /*@ inferred_unit "mps" */ b,
  /*@ inferred_unit "unknown" */ e,
  /*@ inferred_unit "mps" */ sl
ABSTRACT_VARIABLES
  /*@ unit "mps" */ a,
  /*@ inferred_unit "m" */ m,
  /*@ inferred_unit "unknown" */ phase,
  /*@ unit "mps" */ v,
  /*@ unit "m" */ z
PROPERTIES
    A : INTEGER
  & b : INTEGER
  & e : INTEGER
  & sl : INTEGER
  & e > 0
  & A > 0
  & b > 0
  & b = 1
  & A = 2
  & e = 2
  & sl > 0
  & !x.(x : NATURAL => 2 * ((x * x) / 2) : NATURAL)
INVARIANT
    phase : {0,1,2}
  & z : NATURAL
  & a : {0,A,- b}
  & v : NATURAL
  & m : NATURAL
  & 2 * m - 2 * z >= v * v
  & (phase = 2 & v + 2 * a <= 0 => a = - b)
  & (phase = 2 & a = A => 2 * m - 2 * z >= v * v + (24 + 12 * v))
  & (phase = 2 & a = 0 => 2 * m - 2 * z >= v * v + (24 + 12 * v))
ASSERTIONS
  !(x,y).(x : INTEGER & y : INTEGER & not(y = 0) => y * (x / y) = x);
  A * b = 2;
  m - z >= 0
INITIALISATION
    BEGIN
      phase,z,v,a,m := 1,0,0,2,0
    END
OPERATIONS
  get_limit(x) = 
    PRE 
        x : 1 .. 300
      & v = 0
      & m - z < 12
    THEN
      m := m + x
    END;
  
  decide_1 = 
    PRE 
        phase = 1
      & 2 * m - 2 * z < v * v + (24 + 12 * v)
      & A > 0
      & v > 0
    THEN
         a := - b
      ||
         phase := 2
    END;
  
  decide_2 = 
    PRE 
        phase = 1
      & 2 * m - 2 * z >= v * v + (24 + 12 * v)
      & v >= 0
      & e > 0
      & A > 0
      & v + 4 <= sl
    THEN
         a := 2
      ||
         phase := 2
    END;
  
  decide_3 = 
    PRE 
        phase = 1
      & 2 * m - 2 * z >= v * v + (24 + 12 * v)
      & v >= 0
      & e > 0
      & A > 0
      & v + 4 > sl
      & v > 0
    THEN
         a := 0
      ||
         phase := 2
    END;
  
  drive_1 = 
    PRE 
        phase = 2
      & v + 2 * a <= 0
      & a = - b
    THEN
         v := 0
      ||
         z := z + (v * v) / 2
      ||
         phase := 1
    END;
  
  drive_2 = 
    PRE 
        phase = 2
      & v + 2 * a > 0
      & v >= 0
    THEN
         v := v + 2 * a
      ||
         z := z + (2 * v + 2 * a)
      ||
         phase := 1
    END
END
