
MACHINE Car_internal
CONCRETE_CONSTANTS
  /*@ unit "mps" */ maxspeed,
  /*@ unit "m / s**2" */ maxdecelerate,
  /*@ unit "m * s**-2" */ maxaccelerate,
  /*@ unit "s" */ TICK_LENGTH
ABSTRACT_VARIABLES
  /*@ inferred_unit "mps" */ speed,
  /*@ inferred_unit "m" */ curpos
PROPERTIES
    TICK_LENGTH : INTEGER
  & maxspeed : NAT1
  & maxdecelerate : NAT1
  & maxaccelerate : NAT1
  & TICK_LENGTH = 1
INVARIANT
    speed : NAT
  & speed <= maxspeed
  & curpos : NATURAL
INITIALISATION
    BEGIN
         speed := 0
      ||
         curpos := 0
    END
OPERATIONS
  keep_speed(deltat) = 
    PRE 
        deltat : NAT1
    THEN
      curpos := curpos + deltat * speed
    END;
  
  accelerate = 
    ANY delta
    WHERE 
        delta : NAT1
      & delta <= min({maxaccelerate * TICK_LENGTH,maxspeed - speed})
    THEN
         speed := speed + delta
      ||
         curpos := curpos + speed * TICK_LENGTH + delta * TICK_LENGTH
    END;
  
  brake = 
    ANY delta
    WHERE 
        delta : NAT1
      & delta <= maxdecelerate * TICK_LENGTH
      & delta <= speed
    THEN
         speed := speed - delta
      ||
         curpos := (curpos + speed * TICK_LENGTH) - delta * TICK_LENGTH
    END;
  
  full_brake = 
    ANY delta
    WHERE 
        delta : NAT
      & (speed >= maxdecelerate * TICK_LENGTH => delta = maxdecelerate * TICK_LENGTH)
      & (speed < maxdecelerate * TICK_LENGTH => delta = speed)
    THEN
         speed := speed - delta
      ||
         curpos := (curpos + speed * TICK_LENGTH) - delta * TICK_LENGTH
    END
END
