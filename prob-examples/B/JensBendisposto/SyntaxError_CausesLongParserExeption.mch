MACHINE SchleuseN2

SETS DOORS = {DOOR1, DOOR2, DOOR3, DOOR4};  DOOR_STATE = {opened, closed}; LEVEL_STATE = {A,B,C}; WATERGATES = {WG1, WG2}

CONSTANTS D1, D2, D3, D4

PROPERTIES   D1 : DOORS &
             D2 : DOORS &
             D3 : DOORS &
             D4 : DOORS &
            
             D1 = DOOR1 & D2 = DOOR2 & D3 = DOOR3 & D4 = DOOR4 
/* D1 /= D2 & D2 /= D3 & D3 /= D4 & D1 /= D3 & D1 /= D4 & D2 /= D4 */

VARIABLES left_level, right_level, state, isLeftDoor, isRightDoor, allowedLevel
	
INVARIANT isLeftDoor : WATERGATES -->  DOORS&
          allowedLevel : WATERGATES -->  LEVEL_STATE&
          isRightDoor : WATERGATES --> DOORS &
          left_level : DOORS --> LEVEL_STATE &
	  right_level : DOORS --> LEVEL_STATE &
          state : DOORS --> DOOR_STATE &
          left_level(D1) = A & right_level(D1) /= C &
          right_level(D1) = left_level(D2) &
          right_level(D2) = left_level(D3) &
          left_level(D3) = B &
          right_level(D3) = left_level(D4) &
          right_level(D4) = C & left_level(D4) /= A &
          !(z).((z : DOORS & state(z)=opened) => left_level(z) = right_level(z))


INITIALISATION allowedLevel := {
                WG1 |-> A,
                WG1 |-> B,
                WG2 |-> B,
                WG2 |-> C,
               } ||
               state := DOORS * {closed} ||
               right_level := { 
               D1 |-> B,
               D2 |-> B,
               D3 |-> B,
               D4 |-> C
               } ||
               left_level := {
               D1 |-> A,
               D2 |-> B,
               D3 |-> B,
               D4 |-> B
               } ||
               isRightDoor := {
               WG1 |-> D1,
               WG2 |-> D3
               } || 
               isLeftDoor := {
               WG1 |-> D2,
               WG2 |-> D4
               } 
   

OPERATIONS 
 open(dd) = 
 PRE dd:DOORS & left_level(dd) = right_level(dd) & state(dd) /= opened
 THEN state(dd) := opened
 END;

 close(dd) = 
 PRE dd:DOORS & state(dd) = opened
 THEN state(dd) := closed
 END;

 set(wg,lv) = 
 PRE wg: WATERGATES & lv : LEVEL_STATE & allowedLevel(wg) = lv 
 THEN right_level(isRightDoor(wg)) := lv || left_level(isLeftDoor(wg)) := lv
 END


END

