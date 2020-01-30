/* Car
 * Author: Michael Leuschel
 * Creation date: Fri Jan 23 2009
 */
MACHINE Car
CONSTANTS maxspeed, maxdecelerate, maxaccelerate
PROPERTIES
 maxspeed : NAT1 & 
 maxdecelerate : NAT1 /* maximum value speed can decrease in a time-unit */ &
 maxaccelerate : NAT1 /* maximum value speed can increase in a time-unit */
DEFINITIONS
  cur_max_acceleration == min({maxaccelerate, maxspeed-speed})
VARIABLES speed, curpos
INVARIANT
 speed : NAT & /* average speed over the last time interval */
 speed <= maxspeed &
 curpos : NATURAL /* current position at beginning of time interval */
INITIALISATION speed := 0 || curpos := 0
OPERATIONS
  keep_speed(deltat) = PRE deltat:NAT1 THEN curpos := curpos + deltat*speed END;
  accelerate = ANY delta WHERE delta:NAT1 & delta <= cur_max_acceleration THEN
    speed := speed + delta || curpos := curpos + speed + delta
  END;
  brake = ANY delta WHERE delta:NAT1 & delta <= maxdecelerate & delta <= speed THEN
    speed := speed - delta || curpos := curpos + speed - delta
  END;
  full_brake = ANY delta WHERE  delta:NAT & (speed>=maxdecelerate => delta=maxdecelerate) &
                                (speed<maxdecelerate => delta=speed) THEN
    speed := speed - delta || curpos := curpos + speed - delta
  END
END