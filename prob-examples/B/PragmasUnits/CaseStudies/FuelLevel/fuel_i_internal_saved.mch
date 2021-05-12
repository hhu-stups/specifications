
MACHINE fuel_i_internal
SETS /* enumerated */
  tSTATUS={NOMINAL,LOW_LEVEL}
CONCRETE_CONSTANTS
  /*@ unit "l" */ TANK_CAPACITY,
  /*@ inferred_unit "l" */ MAX_CONSUMPTION,
  /*@ inferred_unit "l" */ WARNING_CAPACITY
CONCRETE_VARIABLES
  /*@ inferred_unit "l" */ estimated_level,
  /*@ inferred_unit "l" */ estimated_consumption,
  /*@ inferred_unit "unknown" */ status
PROPERTIES
    TANK_CAPACITY : NAT1
  & MAX_CONSUMPTION : NAT1
  & WARNING_CAPACITY : NAT1
  & MAX_CONSUMPTION < TANK_CAPACITY
  & WARNING_CAPACITY < TANK_CAPACITY
INVARIANT
    status : tSTATUS
  & estimated_level : 0 .. TANK_CAPACITY
  & estimated_consumption : 0 .. MAX_CONSUMPTION
  & (estimated_level <= WARNING_CAPACITY => status = LOW_LEVEL)
INITIALISATION
    BEGIN
      estimated_level,estimated_consumption,status := 0,0,LOW_LEVEL
    END
OPERATIONS
  compute_remaining_fuel =
    VAR m1,m2,m3
    IN
        m1,m2,m3 <-- fuel_i__measure_consumption
      ;
        estimated_consumption <-- fuel_i__maximum(m1,m2,m3)
      ;
        IF estimated_consumption >= estimated_level THEN
          estimated_level := 0
        ELSE
          estimated_level := estimated_level - estimated_consumption
        END
      ;
        IF estimated_level <= WARNING_CAPACITY THEN
          status := LOW_LEVEL
        END
    END;

  compute_initial_level =
    VAR m1,m2
    IN
        m1,m2 <-- fuel_i__measure_level
      ;
        estimated_level <-- fuel_i__minimum(m1,m2)
      ;
        IF estimated_level <= WARNING_CAPACITY THEN
          status := LOW_LEVEL
        ELSE
          status := NOMINAL
        END
    END;

  m1,m2 <-- fuel_i__measure_level =
    BEGIN
         m1 :: 0 .. TANK_CAPACITY
      ||
         m2 :: 0 .. TANK_CAPACITY
    END;

  m1,m2,m3 <-- fuel_i__measure_consumption =
    BEGIN
         m1 :: 0 .. MAX_CONSUMPTION
      ||
         m2 :: 0 .. MAX_CONSUMPTION
      ||
         m3 :: 0 .. MAX_CONSUMPTION
    END;

  rr <-- fuel_i__minimum(aa,bb) =
    PRE
        aa : NAT
      & bb : NAT
    THEN
      rr := min({aa,bb})
    END;

  rr <-- fuel_i__maximum(aa,bb,cc) =
    PRE
        aa : NAT
      & bb : NAT
      & cc : NAT
    THEN
      rr := max({aa,bb,cc})
    END
END
