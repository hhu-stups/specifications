
MACHINE fuel0_internal
SETS /* enumerated */
  tSTATUS={NOMINAL,LOW_LEVEL}
CONCRETE_CONSTANTS
  /*@ unit "l" */ TANK_CAPACITY,
  /*@ inferred_unit "l" */ MAX_CONSUMPTION,
  /*@ inferred_unit "l" */ WARNING_CAPACITY
ABSTRACT_VARIABLES
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
         estimated_level := 0
      ||
         estimated_consumption := 0
      ||
         status := LOW_LEVEL
    END
OPERATIONS
  compute_initial_level =
    estimated_level,status : (status : tSTATUS & (estimated_level : 0 .. TANK_CAPACITY & (estimated_level <= WARNING_CAPACITY => status = LOW_LEVEL)));
  
  compute_remaining_fuel = 
    estimated_level,estimated_consumption,status : (status : tSTATUS & (estimated_level : 0 .. TANK_CAPACITY & estimated_consumption : 0 .. MAX_CONSUMPTION & estimated_level <= estimated_level$0 & (estimated_level <= WARNING_CAPACITY => status = LOW_LEVEL)))
END
