/* Car
 * Author: Michael Leuschel
 * Creation date: Fri Jan 23 2009
 */
MACHINE Car
CONSTANTS
 /* speed was stored as length / tick */
 /*@ unit "mps" */ maxspeed,
 /*@ unit "m / s**2" */ maxdecelerate,
 /*@ unit "m * s**-2" */ maxaccelerate,
 /*@ unit "s" */ TICK_LENGTH
PROPERTIES
 maxspeed : NAT1 &
 maxdecelerate : NAT1 /* maximum value speed can decrease in a time-unit */ &
 maxaccelerate : NAT1 /* maximum value speed can increase in a time-unit */ &
 TICK_LENGTH = 1
DEFINITIONS
  cur_max_acceleration == min({maxaccelerate*TICK_LENGTH, maxspeed-speed});
VARIABLES
 speed,
 curpos
INVARIANT
 speed : NAT & /* average speed over the last time interval */
 speed <= maxspeed &
 curpos : NATURAL /* current position at beginning of time interval */
INITIALISATION speed := 0 || curpos := 0
OPERATIONS
  keep_speed(deltat) = PRE deltat:NAT1 THEN curpos := curpos + deltat*speed END;
  accelerate = ANY delta WHERE delta:NAT1 & delta <= cur_max_acceleration THEN
    speed := speed + delta || curpos := curpos + speed*TICK_LENGTH + delta*TICK_LENGTH
  END;
  brake = ANY delta WHERE delta:NAT1 & delta <= maxdecelerate*TICK_LENGTH & delta <= speed THEN
    speed := speed - delta || curpos := curpos + speed*TICK_LENGTH - delta*TICK_LENGTH
  END;
  full_brake = ANY delta WHERE  delta:NAT & (speed>=maxdecelerate*TICK_LENGTH => delta=maxdecelerate*TICK_LENGTH) &
                                (speed<maxdecelerate*TICK_LENGTH => delta=speed) THEN
    speed := speed - delta || curpos := curpos + speed*TICK_LENGTH - delta*TICK_LENGTH
  END
END
