
MACHINE System_internal
SETS /* enumerated */
  COLOR={green,orange,red}
CONCRETE_CONSTANTS
  /*@ unit "mps" */ maxspeed,
  /*@ unit "m / s**2" */ maxdecelerate,
  /*@ unit "m * s**-2" */ maxaccelerate,
  /*@ unit "s" */ TICK_LENGTH,
  /*@ unit "m" */ TLpos,
  /*@ unit "s" */ green_orange_time,
  /*@ inferred_unit "s" */ orange_red_time,
  /*@ inferred_unit "s" */ red_green_time
ABSTRACT_VARIABLES
  /*@ inferred_unit "m" */ prevpos,
  /*@ inferred_unit "mps" */ speed,
  /*@ inferred_unit "m" */ curpos,
  /*@ inferred_unit "unknown" */ status,
  /*@ inferred_unit "s" */ time
PROPERTIES
    TICK_LENGTH : INTEGER
  & maxspeed > 2
  & orange_red_time = 1
  & red_green_time = 3
  & green_orange_time = 2
  & TLpos > 5
  & maxspeed : NAT1
  & maxdecelerate : NAT1
  & maxaccelerate : NAT1
  & TICK_LENGTH = 1
  & TLpos : NATURAL1
  & green_orange_time : NATURAL1
  & orange_red_time : NATURAL1
  & red_green_time : NATURAL1
INVARIANT
    status : COLOR
  & prevpos : NATURAL
  & not(prevpos <= TLpos & curpos > TLpos & status = red)
  & not(prevpos <= TLpos & curpos > TLpos & status = orange)
  & speed : NAT
  & speed <= maxspeed
  & curpos : NATURAL
  & time : NATURAL
  & time < green_orange_time + orange_red_time + red_green_time
INITIALISATION
    BEGIN
           speed := 0
        ||
           curpos := 0
      ;
           status := green
        ||
           time := 0
      ;
        prevpos := 0
    END
OPERATIONS
  x <-- debug = 
    BEGIN
      x := speed / maxdecelerate + min({1,speed mod maxdecelerate}) / ((maxdecelerate + 1) mod maxdecelerate)
    END;
  
  OneTick_Keep = 
    SELECT 
        curpos <= TLpos
      & not(speed > 0 & TLpos >= curpos & not((time + (1 + (TLpos - curpos) / speed)) mod (green_orange_time + orange_red_time + red_green_time) < green_orange_time) & TLpos - curpos <= speed * TICK_LENGTH)
    THEN 
         AdvanceTLTime
      ||
         keep_speed(1)
      ||
         prevpos := curpos
    END;
  
  OneTick_Acc = 
    SELECT 
        curpos <= TLpos
      & not(TLpos >= curpos & (speed > 0 => #tt.(tt : 1 + (TLpos - curpos) / (speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) .. 1 + (TLpos - curpos) / speed & not((time + tt) mod (green_orange_time + orange_red_time + red_green_time) < green_orange_time))) & (speed = 0 => #tt.(tt : 1 + (TLpos - curpos) / (speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) .. 1 + (TLpos - curpos) / (speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) + (1 + (TLpos - curpos) / 1) & not((time + tt) mod (green_orange_time + orange_red_time + red_green_time) < green_orange_time))) & TLpos - curpos <= (speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) * TICK_LENGTH)
    THEN 
         AdvanceTLTime
      ||
         accelerate
      ||
         prevpos := curpos
    END;
  
  OneTick_Brake = 
    SELECT 
        curpos <= TLpos
      & not(speed > 0 & TLpos >= curpos & not((time + (1 + (TLpos - curpos) / speed)) mod (green_orange_time + orange_red_time + red_green_time) < green_orange_time) & TLpos - curpos <= speed * TICK_LENGTH)
    THEN 
         AdvanceTLTime
      ||
         brake
      ||
         prevpos := curpos
    END;
  
  OneTick_FullBrake = 
    BEGIN
         AdvanceTLTime
      ||
         full_brake
      ||
         prevpos := curpos
    END;
  
  Finished = 
    SELECT 
        curpos > TLpos
      & speed = 0
    THEN 
      skip
    END;
  
  st <-- TL_Status_at_ETA = 
    SELECT 
        speed > 0
      & TLpos >= curpos
    THEN 
      st <-- PredictStatusAtTime(1 + (TLpos - curpos) / speed)
    END;
  
  Emergency_Warning = 
    SELECT 
        speed > 0
      & TLpos >= curpos
      & not((time + (1 + (TLpos - curpos) / speed)) mod (green_orange_time + orange_red_time + red_green_time) < green_orange_time)
      & TLpos - curpos <= speed * TICK_LENGTH
    THEN 
      skip
    END;
  
  NoAcceleration_Warning = 
    SELECT 
        TLpos >= curpos
      & (speed > 0 => #tt.(tt : 1 + (TLpos - curpos) / (speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) .. 1 + (TLpos - curpos) / speed & not((time + tt) mod (green_orange_time + orange_red_time + red_green_time) < green_orange_time)))
      & (speed = 0 => #tt.(tt : 1 + (TLpos - curpos) / (speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) .. 1 + (TLpos - curpos) / (speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) + (1 + (TLpos - curpos) / 1) & not((time + tt) mod (green_orange_time + orange_red_time + red_green_time) < green_orange_time)))
      & TLpos - curpos <= (speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) * TICK_LENGTH
    THEN 
      skip
    END;
  
  dist <-- MinBreakingDistance = 
    BEGIN
      dist := max({0,speed * (speed / maxdecelerate + min({1,speed mod maxdecelerate}) / ((maxdecelerate + 1) mod maxdecelerate)) - ((speed / maxdecelerate + min({1,speed mod maxdecelerate}) / ((maxdecelerate + 1) mod maxdecelerate)) * (speed / maxdecelerate + min({1,speed mod maxdecelerate}) / ((maxdecelerate + 1) mod maxdecelerate)) * maxdecelerate) / 2})
    END;
  
  dist <-- BreakingDistanceIfOneMaxAcceleration = 
    BEGIN
      dist := max({0,(speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) * ((speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) / maxdecelerate + min({1,(speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) mod maxdecelerate}) / ((maxdecelerate + 1) mod maxdecelerate)) - (((speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) / maxdecelerate + min({1,(speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) mod maxdecelerate}) / ((maxdecelerate + 1) mod maxdecelerate)) * ((speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) / maxdecelerate + min({1,(speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) mod maxdecelerate}) / ((maxdecelerate + 1) mod maxdecelerate)) * maxdecelerate) / 2})
    END;
  
  tm <-- BreakTimeIfOneMacAcc = 
    BEGIN
      tm := (speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) / maxdecelerate + min({1,(speed + min({maxaccelerate * TICK_LENGTH,maxspeed - speed})) mod maxdecelerate}) / ((maxdecelerate + 1) mod maxdecelerate)
    END;
  
  RedLightViolation = 
    SELECT 
        prevpos <= TLpos
      & curpos > TLpos
      & status = red
    THEN 
      skip
    END;
  
  OrangeLightViolation = 
    SELECT 
        prevpos <= TLpos
      & curpos > TLpos
      & status = orange
    THEN 
      skip
    END;
  
  CrossedLight = 
    SELECT 
        prevpos <= TLpos
      & curpos > TLpos
    THEN 
      skip
    END;
  
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
    END;
  
  AdvanceTLTime = 
    BEGIN
         time := (time + 1) mod (green_orange_time + orange_red_time + red_green_time)
      ||
         SELECT 
             status = green
           & time = green_orange_time - 1
         THEN 
           status := orange
         WHEN 
             status = orange
           & time = (green_orange_time + orange_red_time) - 1
         THEN 
           status := red
         WHEN 
             status = red
           & time = (green_orange_time + orange_red_time + red_green_time) - 1
         THEN 
           status := green
         ELSE
           skip
         END
    END;
  
  st <-- PredictStatusAtTime(tt) = 
    PRE 
        tt : NAT
      & tt >= 0
    THEN
      LET tmod BE tmod = (time + tt) mod (green_orange_time + orange_red_time + red_green_time)
      IN
        SELECT 
            tmod < green_orange_time
        THEN 
          st := green
        WHEN 
            tmod >= green_orange_time
          & tmod < green_orange_time + orange_red_time
        THEN 
          st := orange
        ELSE
          st := red
        END
      END
    END
END
