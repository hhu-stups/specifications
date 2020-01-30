
/******* new version - to be completed *******/

MACHINE M_Lift_DRAFT_NewVersion

SETS 
   status = {ON, OFF};
   door_status = {open, closed};
   lift_direction = {up, down};
   button_status = {pushed, released} 

VARIABLES 
   current_floor,

   requested_floors_up,
   requested_floors_down,
   button_up_calls,
   button_down_calls,

   direction,

/*-- actuators and sensors --*/
 
   lift_motor_actuator,
   lift_motor_sensor,

   door_obstacle_sensor,
   lift_door_actuator,
   lift_door_sensor,
   landing_door_actuator,
   landing_door_sensor,

   lift_presence_sensor,   

/*******************/
/* inside the lift */
/*******************/
   
/* the lift panel has a set of buttons, one for each floor */
   floor_buttons_panel, 

/* button for requesting travelling to a floor */
/*   requested_floor,*/

/* checks whether at least one button of the lift panel is enabled */ 
   floor_button_pushed,

   stop_button, 

/********************/
/* outside the lift */
/********************/

/* button for requesting travelling upward to another floor */
   button_up_on_floor,

/* button for requesting travelling downward to another floor */ 
   button_down_on_floor,  

   button_up_pushed,
   button_down_pushed

CONSTANTS 
   highest_floor, 
   lowest_floor 

PROPERTIES 
   lowest_floor		: INT & 
   highest_floor	: INT & 
   (highest_floor > lowest_floor) 

INVARIANT
   current_floor : lowest_floor .. highest_floor & 

   floor_buttons_panel : lowest_floor .. highest_floor --> button_status & 

   lift_presence_sensor : lowest_floor .. highest_floor --> status &

   button_up_on_floor  : lowest_floor .. highest_floor --> status &
   button_down_on_floor: lowest_floor .. highest_floor --> status &

   stop_button 		: status &

   requested_floors_up	<: INT &
   requested_floors_down<: INT &

   button_up_calls	<: INT &
   button_down_calls	<: INT &

   direction : lift_direction &

   floor_button_pushed : status &
   
   button_up_pushed : status &

   button_down_pushed : status &

   lift_motor_actuator  : status &
   lift_motor_sensor	: status &

   door_obstacle_sensor : status &
   lift_door_actuator	: door_status &
   lift_door_sensor	: status &
   landing_door_actuator: door_status &
   landing_door_sensor	: status &

  (lift_motor_actuator = ON => lift_door_sensor = ON 
                               & door_obstacle_sensor = OFF) &
  (lift_motor_sensor = ON => lift_door_sensor = ON 
                               & door_obstacle_sensor = OFF) &

  (lift_motor_actuator = ON => landing_door_sensor = ON
                               & door_obstacle_sensor = OFF) &
  (lift_motor_sensor = ON => landing_door_sensor = ON
                               & door_obstacle_sensor = OFF) 

INITIALISATION
   current_floor	:= -1 ||

   floor_buttons_panel	:= (lowest_floor .. highest_floor) * {released} ||

   button_up_on_floor	:= (lowest_floor .. highest_floor) * {OFF} ||
   button_down_on_floor	:= (lowest_floor .. highest_floor) * {OFF} ||

   stop_button		:= OFF ||

   requested_floors_up 	:= <> ||
   requested_floors_down := <> ||
   
   button_up_calls	:= <> ||
   button_down_calls	:= <> ||   

   direction 		:= up ||

   floor_button_pushed  := OFF ||

   button_up_pushed  := OFF ||

   button_down_pushed := OFF ||

   lift_motor_actuator	:= OFF ||
   lift_motor_sensor	:= OFF ||

   door_obstacle_sensor := OFF ||
   lift_door_actuator	:= closed ||
   lift_door_sensor	:= ON ||
   landing_door_actuator:= closed || 
   landing_door_sensor	:= ON ||   

   lift_presence_sensor := (lowest_floor .. highest_floor) * {OFF} 

OPERATIONS

/* checks if the lift is on the ground floor */
   ground <-- ground_floor = 
     IF 
       current_floor /= 0   
     THEN 
       ground := FALSE 
     ELSE
       ground := TRUE 
     END;

/* the lift moves upward */

   lift_direction_up = 
     PRE 
       direction = down &
       (requested_floors_up /= {} or
       button_up_calls /= {}) & 
       (requested_floors_down = {} or
       button_down_calls = {}) &
       lift_motor_actuator = ON &
       lift_motor_sensor = ON &
       stop_button = OFF  
     THEN 
       direction := up
     END;

/* the lift moves downward */

   lift_direction_down = 
     PRE
       direction = up &
       (requested_floors_up = {} or
       button_up_calls = {}) & 
       (requested_floors_down /= {} or 
       button_down_calls /= {}) &
       lift_motor_actuator = ON &
       lift_motor_sensor = ON &
       stop_button = OFF  
     THEN 
       direction:= down 
     END;


/******************************************/
/* Connecting the Controller to the Motor */
/******************************************/

/*-- Lift Motor --*/

/* starting the lift motor */

   start_lift_motor =
     PRE 
       lift_motor_actuator = ON &
       lift_motor_sensor = OFF &
       stop_button = OFF 
     THEN
       lift_motor_sensor := ON 
     END;

/* the lift moves upward */

   move_lift_up =
     PRE 
       lift_motor_actuator = ON &
       lift_motor_sensor = ON &
       (requested_floors_up /= {} or
       button_up_calls /= {}) &
       stop_button = OFF &
       direction = up
     THEN
       lift_presence_sensor(current_floor) := OFF ||
       current_floor := current_floor + 1 ||
       ctrl_stop_lift_motor 
     END;

/* the lift moves downward */

   move_lift_down =
     PRE 
       lift_motor_actuator = ON &
       lift_motor_sensor = ON &
       (requested_floors_down /= {} or 
       button_down_calls /= {}) &
       stop_button = OFF &
       direction = down   
     THEN
       lift_presence_sensor(current_floor) := OFF ||
       current_floor := current_floor - 1 ||
       ctrl_stop_lift_motor 
     END;


/* stopping the lift motor */

   stop_lift_motor =
     PRE 
       lift_motor_actuator = OFF &
       lift_motor_sensor = ON 
     THEN
       lift_motor_sensor := OFF ||
       
       IF
         lift_presence_sensor(current_floor) = OFF 
       THEN
         lift_presence_sensor(current_floor) := ON 
       END ||  

       IF 
         (requested_floors_up /= {} or
         requested_floors_down /= {} or
         button_up_calls /= {} or 
         button_down_calls /= {}) &
         (requested_floors_up = requested_floors_up \/ {current_floor} or
         requested_floors_down = requested_floors_down \/ {current_floor} or 
         button_up_calls = button_up_calls \/ {current_floor} or
         button_down_calls = button_down_calls \/ {current_floor})&
         lift_door_actuator = closed &
         landing_door_actuator = closed
       THEN
         lift_door_actuator := open ||
         landing_door_actuator := open              
       END  
     END;


/*-- CONTROLLER (Motor) --*/

/* controlling the starting and stopping of the lift motor*/

   ctrl_start_lift_motor =
     PRE 
       lift_motor_actuator = OFF &
       lift_motor_sensor = OFF &
       door_obstacle_sensor = OFF &
       lift_door_actuator = closed &
       lift_door_sensor = ON &
       landing_door_actuator = closed &
       landing_door_sensor = ON & 
       (floor_button_pushed = ON or
       button_down_pushed = ON or
       button_up_pushed = ON) &
       (requested_floors_up /= {} or
       requested_floors_down /= {} or  
       button_up_calls /= {} or 
       button_down_calls /= {}) &
       stop_button = OFF 
     THEN
       lift_motor_actuator := ON   
   END;

   ctrl_stop_lift_motor = 
     PRE
       lift_motor_actuator = ON &
       lift_motor_sensor = ON       
     THEN
       lift_motor_actuator := OFF 
     END;

/*******************************************************************/
/* Connecting the Controller to the Lift-Door and the Landing-Door */
/*******************************************************************/


/*-- lift door and landing door --*/

/* closing the lift and landing doors */

   close_lift_and_landing_doors =
     WHEN 
       door_obstacle_sensor = OFF &
       lift_door_actuator = closed &
       lift_door_sensor = OFF &
       landing_door_actuator = closed &
       landing_door_sensor = OFF &
       stop_button = OFF  
     THEN
       lift_door_sensor := ON ||
       landing_door_sensor := ON 
     END;

/* opening the lift and landing doors */

   open_lift_and_landing_doors =
     WHEN 
       lift_door_actuator = open &
       lift_door_sensor = ON &
       landing_door_actuator = open & 
       landing_door_sensor = ON &
       lift_motor_actuator = OFF &
       lift_motor_sensor = OFF & 
       stop_button = OFF 
     THEN
       lift_door_sensor := OFF ||
       landing_door_sensor := OFF ||
       
       IF 
         requested_floors_up /= {} 
       THEN
         requested_floors_up := requested_floors_up - {current_floor} ||
         floor_buttons_panel(current_floor) := released 
       ELSIF
         requested_floors_down /= {} 
       THEN
         requested_floors_down := requested_floors_down - {current_floor} ||
         floor_buttons_panel(current_floor) := released 
       END ||
       
       IF
         button_up_calls /= {} 
       THEN
         button_up_calls := button_up_calls - {current_floor} ||
         button_up_on_floor(current_floor) := OFF  
       END ||

       IF
         button_down_calls /= {}  
       THEN
         button_down_calls := button_down_calls - {current_floor} ||
         button_down_on_floor(current_floor) := OFF 
       END 
     END;


/* CONTROLLER (lift and landing doors) */

/* controlling the opening and closing of lift and landing doors */

   ctrl_close_lift_and_landing_doors =
     WHEN
       door_obstacle_sensor = OFF &
       lift_door_actuator = open &
       lift_door_sensor = OFF &
       landing_door_actuator = open &
       landing_door_sensor = OFF &
       stop_button = OFF 
     THEN
       lift_door_actuator := closed ||
       landing_door_actuator := closed 
     END;

   ctrl_open_lift_and_landing_doors = 
     WHEN
       lift_door_actuator = closed &
       lift_door_sensor = ON &
       landing_door_actuator = closed &
       landing_door_sensor = ON & 
       lift_motor_actuator = OFF &
       lift_motor_sensor = OFF &
       stop_button = OFF &
       lift_presence_sensor(current_floor) = ON &
       (floor_button_pushed = ON or
        button_up_pushed = ON or
        button_down_pushed = ON) 
     THEN
       lift_door_actuator := open ||
       landing_door_actuator := open 
     END;


/************************************************/
/* Connecting the Controller to the Stop Button */
/************************************************/

/*-- stop button --*/

   push_stop_button =
     WHEN 
       stop_button = OFF &
       lift_motor_actuator = ON &
       lift_motor_sensor = ON &
       lift_door_actuator = closed &
       lift_door_sensor = ON &
       landing_door_actuator = closed &
       landing_door_sensor = ON 
     THEN
       stop_button := ON ||
       lift_motor_actuator := OFF ||
       lift_motor_sensor := OFF ||           
       IF
         floor_button_pushed = ON
       THEN 
         floor_button_pushed := OFF 
       END ||

       IF 
         button_up_pushed = ON
       THEN 
         button_up_pushed := OFF 
       END ||

       IF 
         button_down_pushed = ON
       THEN 
         button_down_pushed := OFF
       END 
     END;

   release_stop_button =
     WHEN 
       stop_button = ON &
       lift_motor_actuator = OFF &
       lift_motor_sensor = OFF &
       lift_door_actuator = closed &
       lift_door_sensor = ON &
       landing_door_actuator = closed &
       landing_door_sensor = ON 
     THEN
       stop_button := OFF ||
       lift_motor_actuator := ON || 
       lift_motor_sensor := ON ||           
       IF
         floor_button_pushed = OFF & 
         (requested_floors_up /= {} or  requested_floors_down /= {})
       THEN 
         floor_button_pushed := ON 
       END ||

       IF 
         button_up_pushed = OFF &
         button_up_calls /={}
       THEN 
         button_up_pushed := ON
       END ||

       IF 
         button_down_pushed = OFF &
         button_down_calls /= {}
       THEN 
         button_down_pushed := ON
       END 
     END;


/*****************************************************/
/* Connecting the Controller to the Direction Buttons 
               (Up-Button and Down-Button 
                Up-Button-Sign and Down-Button-Sign) */
/*****************************************************/

   push_button_up_on_floor(button_up_request) = 
     WHEN
       button_up_request : lowest_floor .. highest_floor &
       button_up_on_floor(button_up_request) = OFF &
       button_up_request >= current_floor &
       stop_button = OFF 
     THEN
       IF
         button_up_request /= current_floor     
       THEN
         IF 
           button_up_pushed = OFF   
         THEN
           button_up_pushed := ON 
         END ||
 
         button_up_on_floor(button_up_request) := ON ||
         button_up_calls := button_up_calls \/ {button_up_request} 
       ELSE 
         lift_presence_sensor(button_up_request) := ON ||
         lift_door_actuator := open || 
         landing_door_actuator := open
       END      
    END;

   push_button_down_on_floor(button_down_request) = 
     WHEN
       button_down_request : lowest_floor .. highest_floor &
       button_down_on_floor(button_down_request) = OFF &
       button_down_request < current_floor &
       stop_button = OFF 
     THEN
       IF 
         button_down_pushed = OFF   
       THEN
         button_down_pushed := ON 
       END ||

       button_down_on_floor(button_down_request) := ON ||

       button_down_calls := button_down_calls \/ {button_down_request}   
     END;


/***********************************************/
/* Connecting the Controller to the Lift Panel */
/***********************************************/

/* The lift panel has a set of buttons, one for each floor */

   push_in_the_lift_floor_buttons(floor_button) =
     WHEN 
       floor_button : lowest_floor .. highest_floor & 
       floor_buttons_panel(floor_button) = released &
       floor_button /= current_floor &
       stop_button = OFF 
     THEN
       IF 
         floor_button_pushed = OFF 
       THEN
         floor_button_pushed := ON 
       END ||

       floor_buttons_panel(floor_button) := pushed ||

       IF
         floor_button > current_floor  
       THEN  
         requested_floors_up := requested_floors_up \/ {floor_button} 
       ELSIF 
         floor_button < current_floor
       THEN
         requested_floors_down := requested_floors_down \/ {floor_button} 
       END
     END


END