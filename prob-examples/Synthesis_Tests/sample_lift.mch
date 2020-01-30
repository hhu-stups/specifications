
MACHINE sample_lift
SETS /* enumerated */
  GROUPS={staff,visitor}
CONCRETE_CONSTANTS
  max_floor,
  min_floor
ABSTRACT_VARIABLES
  floor,
  group
/* PROMOTED OPERATIONS
  up,
  down,
  swap_group,
  protected_up */
PROPERTIES
    max_floor = 5
  & min_floor = 0
INVARIANT
    floor : INTEGER
  & group : GROUPS
  & floor : NATURAL
  & (floor = max_floor => group = staff)
INITIALISATION
    BEGIN
         floor := 0
      ||
         group := visitor
    END
OPERATIONS
  up = 
    PRE 
        floor < max_floor - 1
    THEN
      floor := floor + 1
    END;
  
  down = 
    PRE 
        floor > min_floor
    THEN
      floor := floor - 1
    END;
  
  swap_group(g) = 
    PRE 
        g /= group
      & floor /= max_floor
    THEN
      group := g
    END;
  
  protected_up = 
    PRE 
        floor = max_floor - 1
    THEN
      floor := max_floor
    END
END
