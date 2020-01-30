
MACHINE TrafficLight_internal
SETS /* enumerated */
  COLOR={green,orange,red}
CONCRETE_CONSTANTS
  /*@ unit "m" */ TLpos,
  /*@ unit "s" */ green_orange_time,
  /*@ inferred_unit "s" */ orange_red_time,
  /*@ inferred_unit "s" */ red_green_time
ABSTRACT_VARIABLES
  /*@ inferred_unit "unknown" */ status,
  /*@ inferred_unit "s" */ time
PROPERTIES
    TLpos : NATURAL1
  & green_orange_time : NATURAL1
  & orange_red_time : NATURAL1
  & red_green_time : NATURAL1
INVARIANT
    status : COLOR
  & time : NATURAL
  & time < green_orange_time + orange_red_time + red_green_time
INITIALISATION
    BEGIN
         status := green
      ||
         time := 0
    END
OPERATIONS
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
