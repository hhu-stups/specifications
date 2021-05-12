/* System
 * Author: Michael Leuschel
 * Creation date: Fri Jan 23 2009
 */
MACHINE
    System
INCLUDES Car, TrafficLight

/* 
  A simple model of traffic light warning system.
  For simplicity we first model one traffic light and one car moving towards the traffic light.
  
  24th January:
  Model now takes predicted traffic light status into account;

  With settings below no invariant violations are found by ProB; but there are maybe still border cases which do not work. Some of the errors found during modelling with ProB are
  documented in Errxx comments below.
 
  Interesting note: if in NOACC we use red_or_orange_predicted rather than
   red_or_orange_predicted_wc we get invariant violations.
  Also, if we use 
  red_or_orange_predicted_wc == (TLpos>=curpos & not(green_predicted(cur_eta_wc)));
  we get invariant violations.

 Note: the current model can be viewed as modelling the system while assuming that one time unit
  is the cycle/response time of the system and that it has perfect knowledge of speed & position.
 If we want to decouple the car speed & position from the information onboard the system and
  if we want to refine the Emergency_Warning and NoAcceleration_Warning operations, we will
  need to relax the conditions on when these can be enabled (i.e., that they can be enabled
  a little bit earlier). 
 Alternatively, if we assume that only the OneTick_* operations are relevant, then refinement
 would allow to strengthen the guards; hence we can actually use this model as a starting
 point even if we want to decouple the actual car model from the onboard information about the car!
*/
PROPERTIES
  maxspeed >2 & orange_red_time = 1 & red_green_time = 3 & green_orange_time = 2 & TLpos>5
DEFINITIONS
  /* ProB Preferences */
  SET_PREF_MAXINT == 7;
  SET_PREF_MAX_INITIALISATIONS == 2250;
  
  /* DEFINITIONS from TrafficLight; could be put into .def file */
  total_cycle_time == (green_orange_time + orange_red_time + red_green_time);
  green_predicted(t) == ((time+t) mod total_cycle_time < green_orange_time);
  
  /*DEFINITIONS from Car; could be put into .def file */
  cur_max_acceleration == min({maxaccelerate, maxspeed-speed});
  
  reaction_time == 1; /* not used in the model yet */
  
  ceil_div(a,b) == (a/b + (b-1+a mod b)/b); /* ceiling division: division rounded upwards */
  
  min_breaking_time(v) == ceil_div(v,maxdecelerate);   /* ERR1: speed instead of v was used in RHS */
  breaking_distance(v,t) == max({0,(v*t - (t*t * maxdecelerate)/2)}); /* ERR3: max was missing */
          /* Note the formula used to solve the continuous physical model is used;
             we may overestimate breaking distance; but that is hopefully fine */
  
  min_breaking_distance == breaking_distance(speed,min_breaking_time(speed));
  speed_wc == speed+cur_max_acceleration; /* worst case if user currently presses acceleration pedal for 1 time unit */
  worst_next_breaking_time == min_breaking_time(speed_wc);
  worst_next_breaking_distance == breaking_distance(speed_wc,worst_next_breaking_time);
  DIST_WARN == (TLpos - curpos <= speed + min_breaking_distance );
  DIST_NOACC == (TLpos - curpos <= speed_wc + worst_next_breaking_distance);

  eta(dist,v) == 1 + dist/v;  /* at what time point will the light be crossed */
                 /* ERR6: eta was defined using ceil_div(dist,v) */ 
  cur_eta == eta(TLpos-curpos,speed);  /* only use if speed>0 & TLpos>=curpos*/
  cur_eta_wc == eta(TLpos-curpos,speed_wc);
 
  JUST_CROSSED_LIGHT == (prevpos <=TLpos & curpos > TLpos); 
  VIOLATION == (JUST_CROSSED_LIGHT & status = red);
  ORANGE_VIOLATION == (JUST_CROSSED_LIGHT & status = orange);
  ASSERT_LTL1 == "G((e(Emergency_Warning) => [OneTick_FullBrake]) & e(NoAcceleration_Warning) => not([OneTick_Acc]))=> G(not(e(RedLightViolation)))";
  ASSERT_LTL2 == "G(not(G e(EmergencyWarning) ))"; /* still false; needs to be augmented with Fairness */


  red_or_orange_predicted == (speed>0 & TLpos>=curpos & not(green_predicted(cur_eta)));
  old_red_or_orange_predicted_wc == (TLpos>=curpos & not(green_predicted(cur_eta_wc)));
  red_or_orange_predicted_wc == (TLpos>=curpos & 
               /* ERR2: !tt instead of #tt was used below */
                     (speed>0 => #tt.(tt:cur_eta_wc..cur_eta & /* ERR4: was cur_eta..cur_eta_wc */
                                      not(green_predicted(tt)))) &                                           
                     (speed=0 => #tt.(tt:cur_eta_wc..cur_eta_wc+eta(TLpos-curpos,1)  & /* ERR5: was 0..cur_eta_wc */
                                      not(green_predicted(tt)))) );

  WARN == (red_or_orange_predicted & DIST_WARN);  /* Warn the user: he should apply full brakes */
  NOACC == (red_or_orange_predicted_wc & DIST_NOACC); /* Warn user: he is not allowed to accelerate anymore */
  GOAL == NOACC
 /* we may also need a NODEC warning; although what will happen when we have more than one traffic
    light and one says NODEC and one WARN ? */
VARIABLES prevpos
INVARIANT
 prevpos : NATURAL & not(VIOLATION) & not(ORANGE_VIOLATION)
INITIALISATION prevpos := 0
OPERATIONS
  /* The following four operations advance time of both the car & the traffic light */
  /* the difference is whether the car keeps its speed, acclerates, brakes or applies full brakes */
  OneTick_Keep = SELECT curpos <= TLpos & not(WARN) THEN AdvanceTLTime || keep_speed(1) || prevpos := curpos END;
  OneTick_Acc = SELECT curpos <= TLpos & not(NOACC) THEN AdvanceTLTime || accelerate || prevpos := curpos END;
  OneTick_Brake = SELECT curpos <= TLpos & not(WARN) THEN AdvanceTLTime || brake || prevpos := curpos END;
  OneTick_FullBrake = BEGIN AdvanceTLTime || full_brake || prevpos := curpos END;

  Finished = SELECT curpos > TLpos & speed = 0 THEN skip END; /* just to avoid deadlocks */

 /* A few query operations for animation & LTL model checking */
  st <-- TL_Status_at_ETA = SELECT speed>0 & TLpos>=curpos THEN
        st <-- PredictStatusAtTime(eta(TLpos-curpos,speed)) END;
  Emergency_Warning = SELECT WARN THEN skip END;
  NoAcceleration_Warning = SELECT NOACC THEN skip END;
  dist <-- MinBreakingDistance = dist := min_breaking_distance;
  dist <-- BreakingDistanceIfOneMaxAcceleration = dist := worst_next_breaking_distance;
  tm <-- BreakTimeIfOneMacAcc = tm := worst_next_breaking_time;
  RedLightViolation = SELECT VIOLATION THEN
     skip END;
  OrangeLightViolation = SELECT ORANGE_VIOLATION THEN
     skip END;
  CrossedLight = SELECT JUST_CROSSED_LIGHT THEN
     skip END
END


/* Coverage Statistics:

NODES
deadlocked:0
invariant_violated:0
live:31433
open:7727
total:39160
TOTAL_OPERATIONS
219329
COVERED_OPERATIONS
setup_constants:490
initialise_machine:490
OneTick_Brake:16348
CrossedLight:2204
TL_Status_at_ETA:14372
Emergency_Warning:3374
NoAcceleration_Warning:16307
OneTick_Keep:22537
OneTick_Acc:16878
OneTick_FullBrake:30942
Finished:2561
MinBreakingDistance:30942
BreakingDistanceIfOneMaxAcceleration:30942
BreakTimeIfOneMacAcc:30942
UNCOVERED_OPERATIONS
RedLightViolation
OrangeLightViolation
keep_speed
accelerate
brake
full_brake
AdvanceTLTime
PredictStatusAtTime


*/
