/* TrafficLight
 * Author: Michael Leuschel
 * Creation date: Fri Jan 23 2009
 */
MACHINE
    TrafficLight
/* We model a traffic light which always operates on the same cycle times for red, green, orange.
   The transition from red to green does not go via an intermediate orange-red state as it
   is not relevant for this application. The orange-red state is for our purposes still
   considered to be red.
   We could model an abstraction of this traffic light which does not require to have
   constant cycle times.
   Without loss of generality, we always start the light in the green condition, as the
   car can always delay moving an arbitrary number of time units anyway.
*/
SETS COLOR = {green,orange,red}
CONSTANTS
 /*@ unit "m" */ TLpos,
 /*@ unit "s" */ green_orange_time,
 orange_red_time,
 red_green_time
DEFINITIONS
  G_O == (status=green & time = green_orange_time-1 );
  O_R == (status=orange & time = green_orange_time+orange_red_time-1);
  R_G == (status=red & time = green_orange_time+orange_red_time+red_green_time-1);
  total_cycle_time == (green_orange_time + orange_red_time + red_green_time);
  green_predicted(t) == ((time+t) mod total_cycle_time < green_orange_time)
PROPERTIES
 TLpos:NATURAL1 &
 green_orange_time:NATURAL1 &
 orange_red_time:NATURAL1 &
 red_green_time:NATURAL1
VARIABLES
 status,
 time
INVARIANT
 status:COLOR & time:NATURAL & time<total_cycle_time
INITIALISATION status:=green || time := 0
OPERATIONS
  AdvanceTLTime =
  BEGIN
     time := (time + 1) mod total_cycle_time ||
     SELECT G_O THEN status := orange
       WHEN O_R THEN status := red
       WHEN R_G THEN status := green
       ELSE skip
     END
  END;
  st <-- PredictStatusAtTime(tt) = PRE tt:NAT & tt>=0 THEN
      LET tmod BE tmod = (time+tt) mod total_cycle_time IN
         SELECT tmod<green_orange_time THEN
                st := green
            WHEN  tmod>=green_orange_time & tmod<green_orange_time+orange_red_time THEN
                st := orange
            ELSE
                st := red
         END
      END
  END
  /*
  Green_to_Orange = SELECT G_O THEN
    status,time := orange,0
  END;
  Orange_to_Red = SELECT O_R THEN
    status,time := red,0
  END;
  Red_to_Green = SELECT R_G THEN
    status,time := green,0
  END */
END
