MACHINE Microwave
DEFINITIONS
/* Testet Eigenschaft 1:
   Wenn die Mikrowelle heizt, dann ist die Tür geschlossen und arretiert*/
 ASSERT_LTL_1 == "G({magnetron=On => door = Closed & door_button_locked = TRUE})";
/* Testet Eigenschaft  2:
   Wenn die Mikrowelle heizt, dann ist die verbleibende Garzeit ungleich 0*/
 ASSERT_LTL_2 == "G({magnetron=On => time /= 0})";
/* Testet Eigenschaft 3:
   Die Mikrowelle kann jederzeit gestoppt werden*/
 ASSERT_LTL_3_1 == "G({magnetron=On} => e(stop_heating))";
 ASSERT_LTL_3_2 == "G([stop_heating] => X({magnetron=Off}))";
/* Testet Eigenschaft 4:
   Die Mikrowelle heizt nicht dauerhaft*/
 ASSERT_LTL_4 == "G({magnetron=On} => F({magnetron=Off}))";
/* Testet Eigenschaft 5:
   Während die Mikrowelle heizt, lässt sich die Zeit nicht durch den Benutzer verstellen*/
 ASSERT_LTL_5 == "G({magnetron=On} => not(e(press_time_button)))";
/* Testet Eigenschaft 6:
   Wenn ein Fehler vorliegt, darf die Mikrowelle nicht heizen*/
 ASSERT_LTL_6 == "G({has_error=TRUE => magnetron=Off})";
/* Testet Eigenschaft 7:
   Die Anzeige zeigt nie weniger Zeit als die wirklich verbleibende Zeit an*/
/* ASSERT_LTL_7 == "G({display'time >= time})";*/
/* Testet Eigenschaft 8:
   Die Mikrowelle heizt nur, wenn vorher der Startknopf gedrückt wurde und zu diesem
   Zeitpunkt die Mikrowelle nicht geheizt hat*/
 ASSERT_LTL_8_1 == "G(({magnetron=Off} & X({magnetron=On})) => [start_heating])";
 ASSERT_LTL_8_2 == "G({magnetron=On} => O[start_heating])";

SETS
 magnetron_states={On,Off};
 door_states={Opened, Closed}
CONSTANTS
 next_time, valid_times
PROPERTIES
/*valid times sind die Gültigen Zeitschritte und next time liefert
 immer den nächsten Zeitschritt*/
 valid_times = {0, 15, 30, 60, 90, 120, 180}
 & next_time : valid_times >->> valid_times
 & next_time = { 0 |-> 15,
                 15 |-> 30,
                 30 |-> 60,
                 60 |-> 90,
                 90 |-> 120,
                 120 |-> 180,
                 180 |-> 0}
VARIABLES
 magnetron, 
 door,
 door_button_locked,
 door_button_pressed,
 time,
 has_error,
 display
INVARIANT
 magnetron : magnetron_states
 & door : door_states
 & door_button_locked : BOOL
 & door_button_pressed : BOOL
 & has_error : BOOL
 & time : valid_times
 & display : struct(heating : BOOL, time : valid_times)
 & time <= display'time
INITIALISATION
 magnetron := Off ||
 door := Closed ||
 door_button_locked := FALSE ||
 door_button_pressed := FALSE ||
 has_error := FALSE ||
 time := 0 ||
 display := rec(heating:FALSE, time:0)
OPERATIONS
 press_door_button =
   PRE door_button_locked = FALSE & door_button_pressed = FALSE
   THEN
      door := Opened ||
      door_button_pressed := TRUE
   END;

 release_door_button =
   PRE door_button_pressed = TRUE
   THEN
      door_button_pressed := FALSE
   END;

 press_time_button =
   PRE magnetron = Off
   THEN
      display := rec(heating:bool(magnetron = On), time: next_time(time)) ||
      time := next_time(time)
   END;

 close_door =
   PRE door = Opened
   THEN
      door := Closed
   END;

 error =
   BEGIN
      has_error := TRUE ||
      magnetron := Off      
   END;

 start_heating =
   PRE magnetron = Off & door = Closed & time /= 0 & has_error = FALSE
   THEN
      magnetron := On ||
      door_button_locked := TRUE ||
      display := rec(heating:TRUE,time:time)
   END;

 wait_heating =
   PRE magnetron = On
   THEN
      IF next_time~(time) = 0
      THEN
         magnetron, door_button_locked := Off, FALSE
      END ||
      time := next_time~(time) ||
      display := rec(heating:bool(magnetron = On), time: next_time~(time))
   END;

 stop_heating =
   PRE magnetron = On
   THEN
      magnetron, time, door_button_locked := Off, 0, FALSE ||
      display := rec(heating:FALSE, time:0)
   END
END

